import 'package:flutter/material.dart';

import '../../resources/text/app_text_theme.dart';

class PrimaryBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const PrimaryBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final isEnabled = onPressed != null;
    final radius = borderRadius ?? BorderRadius.circular(12.0);

    return SizedBox(
      width: width ?? double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isEnabled
              ? const LinearGradient(
            colors: [Color(0xFFAB5DE8), Color(0xFF7B2FBE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isEnabled ? null : const Color(0xFF9E9E9E).withValues(alpha: 0.3),
          borderRadius: radius,
          boxShadow: isEnabled
              ? [
            BoxShadow(
              color: const Color(0xFF7B2FBE).withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: radius,
          child: InkWell(
            onTap: onPressed,
            borderRadius: radius,
            splashColor: Colors.white.withValues(alpha: 0.2),
            highlightColor: Colors.white.withValues(alpha: 0.1),
            child: Padding(
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 24.0,
                  ),
              child: Center(
                child: Text(
                  text,
                  style: textTheme.regular14.copyWith(
                    color: isEnabled ? Colors.white : Colors.white54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}