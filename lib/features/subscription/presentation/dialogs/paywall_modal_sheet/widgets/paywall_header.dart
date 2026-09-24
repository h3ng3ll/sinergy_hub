import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resources/app_shader.dart';
import '../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../matches/presentation/dialogs/filter_modal/widgets/filter_header.dart'
    show ShaderBuilder;

/// Header for the paywall sheet: animated gradient background (mirrors
/// FilterHeader), the crown mark, a title, and a close button.
class PaywallHeader extends StatefulWidget {
  final VoidCallback onClose;

  const PaywallHeader({
    super.key,
    required this.onClose,
  });

  @override
  State<PaywallHeader> createState() => _PaywallHeaderState();
}

class _PaywallHeaderState extends State<PaywallHeader> {
  ui.FragmentShader? _shader;

  @override
  void initState() {
    super.initState();
    _loadShader();
  }

  Future<void> _loadShader() async {
    try {
      final shader = await FragmentProgramManager.get(
        AppShaders.animatedGradient,
      );
      if (mounted) {
        setState(() {
          _shader = shader;
        });
      }
    } catch (e) {
      debugPrint('Failed to load shader: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return ShaderBuilder(
      shader: _shader,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ).copyWith(
          top: MediaQuery.of(context).padding.top + 16.0,
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            spacing: 12.0,
            children: [
              SvgPicture.asset(
                Assets.icons.crown,
                width: 28.0,
                height: 28.0,
              ),
              Expanded(
                child: Text(
                  l10n.paywall_title,
                  style: textTheme.semiBold24.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: widget.onClose,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
