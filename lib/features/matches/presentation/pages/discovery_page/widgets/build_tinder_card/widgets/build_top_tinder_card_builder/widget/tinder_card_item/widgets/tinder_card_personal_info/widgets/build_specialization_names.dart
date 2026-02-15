import 'package:flutter/material.dart';

import '../../../../../../../../../../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../../../../../../../../../onboard_survey/domain/models/specialization/specialization.dart';

class BuildSpecializationNames extends StatelessWidget {
  final List<ESpecialization> searchingSpecializations;

  const BuildSpecializationNames({
    super.key,
    required this.searchingSpecializations,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:
          (searchingSpecializations
              .take(2)
              .map<Widget>(
                (e) => CustomChip(
                  selected: false,
                  label: Text(
                    e.name,
                  ),
                  onTap: null,
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
