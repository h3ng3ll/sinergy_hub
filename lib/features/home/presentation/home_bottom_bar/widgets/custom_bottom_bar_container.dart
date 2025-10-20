import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import 'custom_bottom_bar_item.dart';

class CustomBottomBarContainer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTapItem;

  const CustomBottomBarContainer({
    super.key,
    required this.selectedIndex,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: AppColors.white.value.withValues(
        alpha: 0.1,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          // sigmaX: 5.0,
          // sigmaY: 5.0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomBarItem(
                onTapItem: () => onTapItem(0),
                icon: Icons.home,
                text: 'Home',
                isSelected: selectedIndex == 0,
              ),
              CustomBottomBarItem(
                onTapItem: () => onTapItem(1),
                icon: Icons.favorite,
                text: 'Matches',
                isSelected: selectedIndex == 1,
              ),
              CustomBottomBarItem(
                onTapItem: () => onTapItem(2),
                icon: Icons.person,
                text: 'Profile',
                isSelected: selectedIndex == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
