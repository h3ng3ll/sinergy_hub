import 'dart:ui';

import 'package:collection/collection.dart';

import '../../../../../../../gen/assets.gen.dart';
import '../specialization/specialization.dart';

/// Глобальный словарь всех специализаций.
/// Позволяет обращаться по ключу енама: Specializations.all[ESpecialization.mobileDeveloper]
abstract class Specializations {
  static final Map<ESpecialization, Specialization> all = {
    ESpecialization.frontendDeveloper: Specialization(
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

    ESpecialization.mobileDeveloper: Specialization(
      specialization: ESpecialization.mobileDeveloper,
      name: 'Mobile Developer',
      particulars: [
        'Flutter',
        'React Native',
        'iOS',
        'Android',
      ],
      colors: [
        Color(0xff47dd83),
        Color(0xff36d193),
      ],
      icon: Assets.icons.phone,
    ),

    ESpecialization.backendDeveloper: Specialization(
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
        Color(0xfff3e8ff),
      ],
      icon: Assets.icons.server,
    ),

    ESpecialization.fullStackDeveloper: Specialization(
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

    ESpecialization.devopsEngineer: Specialization(
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

    ESpecialization.dataScientistMLEngineer: Specialization(
      specialization: ESpecialization.dataScientistMLEngineer,
      name: 'Data Scientist / ML Engineer',
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

    ESpecialization.qaTestAutomation: Specialization(
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

    ESpecialization.techLeadCTO: Specialization(
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

    ESpecialization.productManager: Specialization(
      specialization: ESpecialization.productManager,
      name: 'Product Manager',
      particulars: [
        'Product Strategy',
        'Roadmap',
        'User Research',
      ],
      colors: [
        Color(0xff4a90e2),
        Color(0xff5ba3f5),
      ],
      icon: Assets.icons.layer,
    ),

    ESpecialization.productOwner: Specialization(
      specialization: ESpecialization.productOwner,
      name: 'Product Owner',
      particulars: [
        'Backlog Management',
        'Stakeholder Communication',
        'Sprint Planning',
      ],
      colors: [
        Color(0xff3d7fc4),
        Color(0xff4a90e2),
      ],
      icon: Assets.icons.layer,
    ),

    ESpecialization.uiUxDesigner: Specialization(
      specialization: ESpecialization.uiUxDesigner,
      name: 'UI/UX Designer',
      particulars: [
        'User Interface',
        'User Experience',
        'Prototyping',
      ],
      colors: [
        Color(0xffff6b9d),
        Color(0xffc368e8),
      ],
      icon: Assets.icons.layer,
    ),

    ESpecialization.productDesigner: Specialization(
      specialization: ESpecialization.productDesigner,
      name: 'Product Designer',
      particulars: [
        'Design Systems',
        'User Research',
        'Visual Design',
      ],
      colors: [
        Color(0xffc368e8),
        Color(0xff9b6ee8),
      ],
      icon: Assets.icons.layer,
    ),

    ESpecialization.marketingManager: Specialization(
      specialization: ESpecialization.marketingManager,
      name: 'Marketing Manager',
      particulars: [
        'Digital Marketing',
        'Content Strategy',
        'Brand Management',
      ],
      colors: [
        Color(0xffff8a65),
        Color(0xffff7043),
      ],
      icon: Assets.icons.analytic,
    ),

    ESpecialization.growthManager: Specialization(
      specialization: ESpecialization.growthManager,
      name: 'Growth Manager',
      particulars: [
        'User Acquisition',
        'Analytics',
        'A/B Testing',
      ],
      colors: [
        Color(0xff26c6da),
        Color(0xff00acc1),
      ],
      icon: Assets.icons.analytic,
    ),

    ESpecialization.salesManager: Specialization(
      specialization: ESpecialization.salesManager,
      name: 'Sales Manager',
      particulars: [
        'Revenue Growth',
        'Client Relations',
        'Pipeline Management',
      ],
      colors: [
        Color(0xff66bb6a),
        Color(0xff4caf50),
      ],
      icon: Assets.icons.analytic,
    ),

    ESpecialization.businessDeveloper: Specialization(
      specialization: ESpecialization.businessDeveloper,
      name: 'Business Developer',
      particulars: [
        'Partnerships',
        'Market Expansion',
        'Deal Negotiation',
      ],
      colors: [
        Color(0xff42a5f5),
        Color(0xff1e88e5),
      ],
      icon: Assets.icons.analytic,
    ),

    ESpecialization.technicalCoFounder: Specialization(
      specialization: ESpecialization.technicalCoFounder,
      name: 'Technical Co-Founder',
      particulars: [
        'Technology Vision',
        'Team Building',
        'Product Architecture',
      ],
      colors: [
        Color(0xff7e57c2),
        Color(0xff673ab7),
      ],
      icon: Assets.icons.crown,
    ),

    ESpecialization.nonTechnicalCoFounder: Specialization(
      specialization: ESpecialization.nonTechnicalCoFounder,
      name: 'Non-Technical Co-Founder',
      particulars: [
        'Business Strategy',
        'Operations',
        'Partnerships',
      ],
      colors: [
        Color(0xff6b9eff),
        Color(0xff8e7ffc),
      ],
      icon: Assets.icons.crown,
    ),
  };

  static Specialization get(ESpecialization key) => all[key]!;

  static Specialization? getByName(String name) => all.values.firstWhereOrNull(
    (e) => e.specialization.name == name,
  );
}
