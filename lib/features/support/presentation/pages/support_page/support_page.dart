import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/routes/presentation/loading_data_widget.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../../privacy_policy/presentation/pages/privacy_policy_page/widgets/markdown_text.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  late final Future<String> _markdownFuture;

  @override
  void initState() {
    super.initState();
    _markdownFuture = rootBundle.loadString(Assets.data.support);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BuildAnimatedBackground(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<String>(
          future: _markdownFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingDataWidget();
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: HorizontalPadding(
                child: DefaultTextStyle.merge(
                  style: TextStyle(color: colorScheme.onPrimary),
                  child: MarkdownText(source: snapshot.data!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
