import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../gen/assets.gen.dart';
import '../../domain/repositories/i_skill_repository.dart';

class SkillsLocalRepository implements ISkillRepository {
  @override
  Future<List<String>> getSkills() async {
    final jsonString = await rootBundle.loadString(
      Assets.data.skills,
    );
    final skills =
        jsonDecode(
              jsonString,
            )
            as Map<String, dynamic>;
    final res =  skills.values
        .expand(
          (e) => List<String>.from(
            e,
          ),
        )
        .toList();
    return res;
  }
}
