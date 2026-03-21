import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../../../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';
import '../../../../../../../../../../../../../onboard_survey/domain/models/specializations/specializations.dart';

class BuildSpecializationNames extends StatelessWidget {
  final List<ESpecialization> searchingSpecializations;

  const BuildSpecializationNames({
    super.key,
    required this.searchingSpecializations,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children:
          (searchingSpecializations
              .take(2)
              .map<Widget>(
                (e) => Container(
                  padding: EdgeInsets.all(
                    5.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteLilac.value,
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                  child: Text(
                    Specializations.get(e).name,
                  ),
                ),
              )
              .toList()
            ..add(
              searchingSpecializations.length > 2
                  ? CustomChip(
                      selected: false,
                      label: Text(
                        'more ${searchingSpecializations.length - 2}+',
                      ),
                      onTap: null,
                    )
                  : Container(),
            )),
    );
  }
}
