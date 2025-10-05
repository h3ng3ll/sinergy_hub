import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../../../../../doman/models/specialization/specialization.dart';

part 'search_specialization_event.dart';

part 'search_specialization_state.dart';

part 'search_specialization_bloc.freezed.dart';

class SearchSpecializationBloc
    extends Bloc<SearchSpecializationEvent, SearchSpecializationState> {
  SearchSpecializationBloc() : super(const SearchSpecializationState()) {
    on<_Search>(_search);
    on<_Fetch>(_fetch);
  }

  List<Specialization> specialization() => [
    Specialization(
      specialization: ESpecialization.frontendDeveloper,
      name: 'Frontend Developer',
      particulars: [
        'React',
        'Vue',
        'Angular',
      ],
      colors: [
        Color(0xff65a3f9),
        Color(0xff2cc0e5),
      ],
      icon: Assets.icons.code,
    ),
    Specialization(
      specialization: ESpecialization.mobileDeveloper,
      name: 'Mobile Developer',
      particulars: [
        'Flutter',
        'React Native',
        'IOS',
        'Android',
      ],
      colors: [
        Color(0xff47dd83),
        Color(0xff36d193),
      ],
      icon: Assets.icons.phone,
    ),
    Specialization(
      specialization: ESpecialization.backendDeveloper,
      name: 'Backend Developer',
      particulars: [
        'Node.js',
        'Python',
        'PHP',
        '.NET',
      ],
      colors: [
        Color(0xffa675dd),
        Color(0xffac8afa),
      ],
      icon: Assets.icons.server,
    ),
    Specialization(
      specialization: ESpecialization.fullStackDeveloper,
      name: 'Full Stack Developer',
      particulars: [
        'End-to-end development',
      ],
      colors: [
        Color(0xffe6823d),
        Color(0xffd46659),
      ],
      icon: Assets.icons.layer,
    ),
    Specialization(
      specialization: ESpecialization.devopsEngineer,
      name: 'DevOps Engineer',
      particulars: [
        'CI/CD',
        'Cloud',
        'Infrastructure',
      ],
      colors: [
        Color(0xff29c9bc),
        Color(0xff20bbca),
      ],
      icon: Assets.icons.engine,
    ),
    Specialization(
      specialization: ESpecialization.dataScientistMLEngineer,
      name: 'Data Scientist/ ML Engineer',
      particulars: [
        'Machine Learning',
        'AI',
        'Analytics',
      ],
      colors: [
        Color(0xfff271ae),
        Color(0xffe66883),
      ],
      icon: Assets.icons.analytic,
    ),
    Specialization(
      specialization: ESpecialization.qaTestAutomation,
      name: 'QA / Test Automation',
      particulars: [
        'Quality Assurance',
        'Testing',
      ],
      colors: [
        Color(0xfffac51a),
        Color(0xfff09831),
      ],
      icon: Assets.icons.bug,
    ),
    Specialization(
      specialization: ESpecialization.techLeadCTO,
      name: 'Tech Lead / CTO',
      particulars: [
        'Technical Leadership',
      ],
      colors: [
        Color(0xff888bf8),
        Color(0xffb385fa),
      ],
      icon: Assets.icons.crown,
    ),
  ];

  void _search(event, emit) {
    final String query = event.query;

    final specializations = query.isEmpty
        ? specialization()
        : specialization()
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
        specializations: specialization(),
      ),
    );
  }
}
