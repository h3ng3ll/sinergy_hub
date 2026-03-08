
import '../repositories/i_skill_repository.dart';

class GetSkillsUseCase {
  final ISkillRepository _skillRepository;

  GetSkillsUseCase({
    required ISkillRepository skillRepository,
  }) : _skillRepository = skillRepository;

  Future<List<String>> call() async {
    return await _skillRepository.getSkills();
  }
}
