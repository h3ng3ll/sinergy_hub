import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../../../core/widgets/btn/custom_chip.dart';
import '../../../../../../../doman/models/specialization/specialization.dart';

class BuildRoleCard extends StatelessWidget {
  final ESpecialization specialization;
  final String name;
  final String icon;
  final Function(ESpecialization)? onTap;
  final bool isSelected;

  const BuildRoleCard({
    super.key,
    required this.specialization,
    required this.name,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    final isActive = onTap != null;
    final color = !isActive
        ? colorScheme.surface.withValues(
            alpha: 0.4,
          )
        : !isSelected
        ? colorScheme.surface
        : colorScheme.onPrimary;
    return CustomChip(
      width: 178.0,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            width: 10.0,
            height: 10.0,
            icon,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
          Gap(10.0),
          Text(
            name,
            style: textTheme.medium12.copyWith(
              color: color,
            ),
          ),
        ],
      ),
      selected: isSelected,
      onTap: isActive
          ? () {
              onTap!(specialization);
            }
          : null,
    );
  }
}
