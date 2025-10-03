import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Matrix4;

import '../../../../../../../../../../core/resources/colors/app_colors.dart';

class ExperienceCardInactiveBg extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;

  const ExperienceCardInactiveBg({
    super.key,

    required this.child,
    this.padding,
  });

  @override
  State<ExperienceCardInactiveBg> createState() =>
      _ExperienceCardInactiveBgState();
}

class _ExperienceCardInactiveBgState extends State<ExperienceCardInactiveBg>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     AnimationController(
    //       vsync: this,
    //       duration: Duration(
    //         seconds: 10,
    //       ),
    //     )..repeat(
    //       reverse: true,
    //     );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          17.5,
        ),
        gradient: LinearGradient(
          colors: [
            // Color(0xffc4577b),
            AppColors.white.value,
            Color(0xffdef2e5),
          ],
          stops: [
            0.0,
            // _controller.value,
            1.0,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: widget.child,
    );
  }
}
