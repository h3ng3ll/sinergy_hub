import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../translucent_card_container.dart';
import 'build_icon.dart';
import 'build_selected_check.dart';

class SurveyCard extends StatelessWidget {
  final String icon;
  final List<Color> colors;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final Function(RenderBox) onLongPress;

  const SurveyCard({
    super.key,
    required this.icon,
    required this.colors,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return TranslucentCardContainer(
      onLongPress: () => onLongPress(
        context.findRenderObject() as RenderBox,
      ),
      height: 90.0,
      onTap: () => onTap(),
      child: Row(
        children: [
          BuildIcon(
            colors: colors,
            icon: icon,
            width: 50,
            height: 50,
          ),
          Gap(20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.medium14.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                Flexible(
                  child: Text(
                    description,
                    maxLines: 3,
                    style: textTheme.regular12.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isSelected) BuildSelectedCheck(),
          if (!isSelected) Gap(50.0),
        ],
      ),
    );
  }
}
