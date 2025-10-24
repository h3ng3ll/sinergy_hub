import 'dart:ui';

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
        Color(0xffac8afa),
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
  };

  static Specialization get(ESpecialization key) => all[key]!;

}
