import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../../../core/widgets/btn/app_btn.dart';
import '../../../../../core/widgets/btn/custom_text_btn.dart';

/// Free color picker for one background palette color. Pops the picked
/// color on Save, `null` on Cancel / dismiss.
class PaletteColorPickerSheet extends StatefulWidget {
  final Color initialColor;

  const PaletteColorPickerSheet({
    super.key,
    required this.initialColor,
  });

  static Future<Color?> show({
    required Color initialColor,
  }) {
    final rootContext = RootPageRoute.rootKey.currentContext;
    if (rootContext == null) return Future.value(null);
    return showModalBottomSheet<Color?>(
      context: rootContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PaletteColorPickerSheet(
        initialColor: initialColor,
      ),
    );
  }

  @override
  State<PaletteColorPickerSheet> createState() =>
      _PaletteColorPickerSheetState();
}

class _PaletteColorPickerSheetState extends State<PaletteColorPickerSheet> {
  late Color _color = widget.initialColor;

  void _onColorChanged(Color color) {
    setState(() => _color = color);
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  void _onSave() {
    Navigator.pop(context, _color);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.pinkLace.value,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16.0,
        children: [
          ColorPicker(
            pickerColor: _color,
            onColorChanged: _onColorChanged,
            paletteType: PaletteType.hueWheel,
            enableAlpha: false,
            labelTypes: const [],
            displayThumbColor: true,
            portraitOnly: true,
          ),
          Row(
            spacing: 12.0,
            children: [
              Expanded(
                child: CustomTextBtn(
                  onPressed: _onCancel,
                  text: l10n.settings_background_picker_cancel,
                ),
              ),
              Expanded(
                child: PrimaryBtn(
                  onPressed: _onSave,
                  text: l10n.settings_background_picker_save,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
