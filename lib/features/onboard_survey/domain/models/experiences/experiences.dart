import '../experience/experience.dart';
import '../../../../../../../gen/assets.gen.dart';


abstract class Experiences {
  static final Map<EExperience, Experience> experiences = {
    EExperience.junior: Experience(
      name: 'Junior',
      experience: EExperience.junior,
      rangeExperience: '0-2 years',
      description:
      'Learning and growing in your field. Ready to collaborate and gain experience.',
      icon: Assets.icons.seedling,
    ),
    EExperience.middle: Experience(
      name: 'Middle',
      experience: EExperience.middle,
      rangeExperience: '2-5 years',
      description:
      'Confident and independent professional with solid skills.',
      icon: Assets.icons.herb,
    ),
    EExperience.senior: Experience(
      name: 'Senior',
      experience: EExperience.senior,
      rangeExperience: '5+ years',
      description:
      'Expert with deep knowledge and proven track record',
      icon: Assets.icons.tree,
    ),
    EExperience.leadExpert: Experience(
      name: 'Lead/Expert',
      experience: EExperience.leadExpert,
      rangeExperience: 'Leadership experience',
      description:
      'Team management and mentoring with strategic vision',
      icon: Assets.icons.rocket,
    ),
  };

  /// Получить Experience по Enum
  static Experience get(EExperience key) => experiences[key]!;
}