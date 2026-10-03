import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/services/geolocation/failures/geo_failures.dart';
import '../../../../../../core/services/geolocation/models/e_geo_settings_target.dart';
import '../../../../../../core/services/geolocation/models/geo_place.dart';
import '../../../../../../core/services/geolocation/models/geo_position.dart';
import '../../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../../../user/domain/models/user_data/user_data.dart';
import '../../../../../user/domain/models/user_location/user_location.dart';
import '../../../../../user/domain/usecases/detect_current_location_use_case.dart';
import '../../../../../user/domain/usecases/listen_current_user_data_use_case.dart';
import '../../../../../user/domain/usecases/update_user_coordinates_use_case.dart';
import '../../../../../user/domain/usecases/update_user_usecase.dart';

part 'edit_profile_page_event.dart';

part 'edit_profile_page_state.dart';

part 'edit_profile_page_bloc.freezed.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvent, EditProfilePageState> {
  final ListenCurrentUserDataUseCase _listenCurrentUserDataUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final DetectCurrentLocationUseCase _detectCurrentLocationUseCase;
  final UpdateUserCoordinatesUseCase _updateUserCoordinatesUseCase;

  EditProfilePageBloc({
    required this._listenCurrentUserDataUseCase,
    required this._updateUserUseCase,
    required this._detectCurrentLocationUseCase,
    required this._updateUserCoordinatesUseCase,
  }) : super(const EditProfilePageState()) {
    on<_AddSkill>(_addSkill);
    on<_Initialize>(_initialize);
    on<_RemoveSkill>(_removeSkill);
    on<_ApplyChanges>(
      _applyChanges,
      transformer: droppable(),
    );
    on<_DetectLocation>(
      _detectLocation,
      transformer: droppable(),
    );
  }

  Future<void> _detectLocation(
    _DetectLocation event,
    Emitter<EditProfilePageState> emit,
  ) async {
    emit(
      state.copyWith(
        isDetectingLocation: true,
        locationError: '',
        locationSettingsTarget: null,
      ),
    );

    final result = await _detectCurrentLocationUseCase.call();

    result.fold(
      (detected) {
        emit(
          state.copyWith(
            isDetectingLocation: false,
            detectedPosition: detected.position,
            detectedPlace: detected.place,
            locationError: '',
            locationSettingsTarget: null,
          ),
        );
      },
      (failure) {
        emit(
          state.copyWith(
            isDetectingLocation: false,
            locationError: failure.message,
            locationSettingsTarget: failure is GeoFailure
                ? failure.settingsTarget
                : null,
          ),
        );
      },
    );
  }

  void _addSkill(_AddSkill event, emit) {
    final String skillName = event.name;
    final Skill skill = Skill(
      name: skillName,
    );

    final List<Skill> skills = {
      ...state.skills,
      skill,
    }.toList();

    if (skills.length > 30) {
      emit(
        state.copyWith(
          errorMessage: 'Exceeded skills limits',
          status: EditProfilePageStatus.failed,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        skills: skills,
      ),
    );
  }

  void _removeSkill(_RemoveSkill event, emit) {
    final Skill skill = event.skill;

    emit(
      state.copyWith(
        skills: List.from(state.skills)..remove(skill),
      ),
    );
  }

  Future<void> _initialize(
    _Initialize event,
    Emitter<EditProfilePageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(status: EditProfilePageStatus.loading),
      );
      await emit.forEach(
        _listenCurrentUserDataUseCase.call(),
        onData:
            (
              userData,
            ) => state.copyWith(
              userData: userData,
              // Seed skills from the first snapshot only, so later stream
              // emissions (e.g. a specialization saved on a sub-page) do not
              // wipe skill edits that are not saved yet.
              skills: state.userData == null
                  ? userData?.profiler.skills ?? state.skills
                  : state.skills,
            ),
        onError: (e, _) => state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }

  Future<void> _applyChanges(
    _ApplyChanges event,
    Emitter<EditProfilePageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EditProfilePageStatus.updating,
        ),
      );

      final userData = state.userData;
      if (userData == null) {
        emit(
          state.copyWith(
            errorMessage: 'User data not loaded',
            status: EditProfilePageStatus.failed,
          ),
        );
        return;
      }

      // location.hasCoordinates is backend-owned (a Firestore rule rejects
      // any client write that changes it): always copy the existing value
      // forward, never force it true — even right after a GPS detection.
      final location = UserLocation.fromText(
        country: event.country,
        city: event.city,
        countryCode: state.detectedPlace?.countryCode,
        hasCoordinates: userData.location?.hasCoordinates ?? false,
      );

      final result = await _updateUserUseCase.call(
        userData.copyWith(
          firstName: event.firstName,
          lastName: event.lastName,
          age: event.age,
          aboutMe: event.aboutMe,
          location: location,
          profiler: userData.profiler.copyWith(
            skills: state.skills,
          ),
        ),
        event.img,
      );

      await result.fold(
        (_) async {
          // Only sent when "Use my location" was tapped in this session —
          // never a retry loop, per docs/location_backend_contract.md §2.
          var locationError = '';
          final detectedPosition = state.detectedPosition;
          if (detectedPosition != null) {
            final coordinatesResult = await _updateUserCoordinatesUseCase
                .call(
                  position: detectedPosition,
                  place: state.detectedPlace,
                );
            coordinatesResult.fold(
              (_) {},
              (failure) => locationError = failure.message,
            );
          }
          emit(
            state.copyWith(
              status: EditProfilePageStatus.updated,
              locationError: locationError,
            ),
          );
        },
        (failure) async {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: EditProfilePageStatus.failed,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: EditProfilePageStatus.failed,
        ),
      );
    }
  }
}
