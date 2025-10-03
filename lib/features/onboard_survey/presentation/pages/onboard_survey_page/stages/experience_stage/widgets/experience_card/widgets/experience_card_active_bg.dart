import 'package:flutter/material.dart';

import '../../../../../../../../../../core/resources/colors/app_colors.dart';

class ExperienceCardActiveBg extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ExperienceCardActiveBg({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  State<ExperienceCardActiveBg> createState() => _ExperienceCardActiveBgState();
}

class _ExperienceCardActiveBgState extends State<ExperienceCardActiveBg>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(
            seconds: 2,
          ),
        )..repeat(
          reverse: true,
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return Transform.translate(
          offset: Offset(
            0,
            -10 * _controller.value,
          ),
          child: Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                17.5,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0.0,
                    10.0,
                  ),
                  color: AppColors.black.value.withValues(
                    alpha: 0.1,
                  ),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color(0xffc4577b),
                  AppColors.jasperOrange.value,
                  Color(0xffec5639),
                ],
                stops: [
                  0.0,
                  0.6,
                  1.0,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              border: Border.all(
                width: 0.5,
                color: AppColors.jasperOrange.value,
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
