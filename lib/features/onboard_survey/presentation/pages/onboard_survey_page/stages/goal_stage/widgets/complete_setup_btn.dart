import 'package:flutter/material.dart';

import '../../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../../core/widgets/btn/action_btn.dart';

class CompleteSetupBtn extends StatelessWidget {
  final VoidCallback? onPressed;

  const CompleteSetupBtn({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(
      12.0,
    );
    if (onPressed == null) {
      return ActionBtn(
        anyStateColor: Colors.transparent,
        onPressed: onPressed,
        text: 'Complete Setup',
        borderRadius: borderRadius,
      );
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.royalBlue.value,
            AppColors.darkOrchid.value,
          ],
        ),
      ),
      child: ActionBtn(
        border: BorderSide.none,
        anyStateColor: Colors.transparent,
        onPressed: onPressed,
        borderRadius: borderRadius,
        text: 'Complete Setup',
      ),
    );
  }
}
