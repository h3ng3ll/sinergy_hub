import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../doman/models/specialization/specialization.dart';
import '../../../../../doman/models/specializations/specializations.dart';

part 'search_specialization_event.dart';

part 'search_specialization_state.dart';

part 'search_specialization_bloc.freezed.dart';

class SearchSpecializationBloc
    extends Bloc<SearchSpecializationEvent, SearchSpecializationState> {
  SearchSpecializationBloc() : super(const SearchSpecializationState()) {
    on<_Search>(_search);
    on<_Fetch>(_fetch);
  }

  void _search(event, emit) {
    final String query = event.query;

    final specializations = query.isEmpty
        ? Specializations.all.values.toList()
        : Specializations.all.values
              .where(
                (e) => e.name.toLowerCase().contains(
                  query,
                ),
              )
              .toList();
    emit(
      state.copyWith(
        query: query,
        specializations: specializations,
      ),
    );
  }

  void _fetch(event, emit) {
    emit(
      state.copyWith(
        specializations:  Specializations.all.values.toList(),
      ),
    );
  }
}
