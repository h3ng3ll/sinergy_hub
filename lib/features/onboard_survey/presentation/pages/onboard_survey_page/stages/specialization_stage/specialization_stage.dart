import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../doman/models/specialization/specialization.dart';
import '../../widgets/onboard_survey_header.dart';
import '../../widgets/survey_card/survey_card.dart';
import 'widgets/search_input.dart';

class SpecializationStage extends StatelessWidget {
  final Specialization? selectedSpecialization;
  final void Function(String) onSpecializationChanged;
  final Function(Specialization) onSelectSpecialization;
  final Function(RenderBox, Specialization) onLongPressed;

  const SpecializationStage({
    super.key,
    required this.onSpecializationChanged,
    required this.selectedSpecialization,
    required this.onSelectSpecialization,
    required this.onLongPressed,
  });

  List<Specialization> specialization() => [
    Specialization(
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

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: OnboardSurveyHeader(
              title: 'What is your specific specialization? ',
              description: 'Help us find your perfect co-founder match',
            ),
          ),
          Gap(20.0),
          SearchInput(
            onChanged: onSpecializationChanged,
            hintText: 'Search your specialization...',
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                final e = specialization()[index];
                return SurveyCard(
                  isSelected: selectedSpecialization == e,
                  colors: e.colors,
                  icon: e.icon,
                  title: e.name,
                  description: e.particulars.join(
                    ',',
                  ),
                  onTap: () => onSelectSpecialization(
                    e,
                  ),
                  onLongPress: (renderBox) => onLongPressed(
                    renderBox,
                    e,
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) => Gap(
                20.0,
              ),
              itemCount: specialization().length,
            ),
          ),
        ],
      ),
    );
  }
}
