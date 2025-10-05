import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../../../../../doman/models/specialization/specialization.dart';
import '../../widgets/onboard_survey_header.dart';
import 'widgets/build_role_card/build_role_card.dart';
import 'widgets/complete_setup_btn.dart';

class SearchingRoleUI {
  final ESpecialization specialization;
  final String name;
  final String icon;

  SearchingRoleUI({
    required this.specialization,
    required this.name,
    required this.icon,
  });
}

class GoalStage extends StatelessWidget {
  final Function(ESpecialization)? onToggleSearchingSpecialization;
  final List<ESpecialization> selectedSearchingSpecializations;
  final VoidCallback? onCompleteGoal;

  const GoalStage({
    super.key,
    required this.onToggleSearchingSpecialization,
    required this.selectedSearchingSpecializations,
    required this.onCompleteGoal,
  });

  List<SearchingRoleUI> searchingRoles() => [
    SearchingRoleUI(
      specialization: ESpecialization.frontendDeveloper,
      name: 'Frontend Developer',
      icon: Assets.icons.codeOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.backendDeveloper,
      name: 'Backend Developer',
      icon: Assets.icons.serverOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.mobileDeveloper,
      name: 'Mobile Developer',
      icon: Assets.icons.phoneOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.fullStackDeveloper,
      name: 'Full Stack Developer',
      icon: Assets.icons.stackOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.devopsEngineer,
      name: 'DevOps Engineer',
      icon: Assets.icons.engineOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.dataScientistMLEngineer,
      name: 'Data Scientist',
      icon: Assets.icons.chartOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.productManager,
      name: 'Product Manager',
      icon: Assets.icons.dashboardOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.productOwner,
      name: 'Product Owner',
      icon: Assets.icons.personOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.uiUxDesigner,
      name: 'UI/UX Designer',
      icon: Assets.icons.palleteOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.productDesigner,
      name: 'Product Designer',
      icon: Assets.icons.panOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.marketingManager,
      name: 'Marketing Manager',
      icon: Assets.icons.alertOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.growthManager,
      name: 'Growth  Manager',
      icon: Assets.icons.chartOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.salesManager,
      name: 'Sales  Manager',
      icon: Assets.icons.handshakeOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.businessDeveloper,
      name: 'Business Developer',
      icon: Assets.icons.portpolioOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.technicalCoFounder,
      name: 'Technical Co-founder',
      icon: Assets.icons.rocketOutlined,
    ),
    SearchingRoleUI(
      specialization: ESpecialization.nonTechnicalCoFounder,
      name: 'Non-technical Co-founder',
      icon: Assets.icons.startOutlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: OnboardSurveyHeader(
            title: 'Who are you looking for in your team?',
            description: 'Select 1-5 roles',
          ),
        ),
        Gap(20.0),
        Expanded(
          child: Wrap(
            spacing: 5.0,
            runSpacing: 7.0,
            // runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: searchingRoles().map(
              (e) {
                final isSelected = selectedSearchingSpecializations.contains(
                  e.specialization,
                );
                final reachLimit = selectedSearchingSpecializations.length >= 5;
                return BuildRoleCard(
                  specialization: e.specialization,
                  name: e.name,
                  icon: e.icon,
                  onTap: isSelected || !reachLimit ? onToggleSearchingSpecialization : null,
                  isSelected: isSelected,
                );
              },
            ).toList(),
          ),
        ),
        CompleteSetupBtn(
          onPressed: onCompleteGoal,
        ),
      ],
    );
  }
}
