import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../gen/assets.gen.dart';

class BuildMenuItem extends StatelessWidget {
  final String icon;
  final String text;
  final Color? color;
  final VoidCallback onTap;

  const BuildMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24.0,
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 20.0,
                  height: 20.0,
                  colorFilter: color == null
                      ? null
                      : ColorFilter.mode(
                          color!,
                          BlendMode.srcIn,
                        ),
                ),
              ),
            ),
            Gap(15.0),
            Text(
              text,
              style: textTheme.medium16.copyWith(
                color: color,
              ),
            ),
            Spacer(),
            if (color == null)
              SvgPicture.asset(
                Assets.icons.arrowRightOutlined,
                width: 20.0,
                height: 20.0,
              ),
          ],
        ),
      ),
    );
  }
}
