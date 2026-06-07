import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../core/resources/colors/app_colors.dart';
import '../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../core/resources/translations/app_localizations.dart';
import '../../../../../core/services/ui_message_service.dart';
import '../../../../../core/utils/extensions/go_router_x.dart';
import '../../../../../core/widgets/btn/action_btn.dart';
import '../../../../../core/widgets/btn/custom_back_btn.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/padding/horizontal_padding.dart';
import '../../../../home/presentation/home_bottom_bar/widgets/build_animated_background/build_animated_background.dart';
import '../../../domain/usecases/report_use_case.dart';
import '../../bloc/report_bloc/report_bloc.dart';
import 'widgets/complaint_details_input.dart';
import 'widgets/complaint_type_dropdown.dart';

class ReportUserPage extends StatefulWidget {
  final String reportedUserId;

  const ReportUserPage({
    super.key,
    required this.reportedUserId,
  });

  @override
  State<ReportUserPage> createState() => _ReportUserPageState();
}

class _ReportUserPageState extends State<ReportUserPage> {
  late final ReportBloc _reportBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _detailsController = TextEditingController();
  ComplaintType? _complaintType;

  @override
  void initState() {
    super.initState();
    _reportBloc = ReportBloc(
      reportUserUseCase: getIt<ReportUserUseCase>(),
      reportedUserId: widget.reportedUserId,
    );
  }

  @override
  void dispose() {
    _reportBloc.close();
    _detailsController.dispose();
    super.dispose();
  }

  void _onComplaintTypeChanged(ComplaintType? type) {
    setState(() => _complaintType = type);
  }

  void _onBack() {
    context.goBack();
  }

  void _onSubmit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final type = _complaintType;
    if (type == null) return;

    FocusManager.instance.primaryFocus?.unfocus();

    _reportBloc.add(
      ReportEvent.submit(
        reason: type.name,
        details: _detailsController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BlocProvider.value(
      value: _reportBloc,
      child: BuildAnimatedBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            backgroundColor: Colors.transparent,
            forceMaterialTransparency: true,
            leading: CustomBackBtn(onTap: _onBack),
            title: Text(
              l10n.report_user_title,
              style: textTheme.medium16.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
          ),
          body: BlocListener<ReportBloc, ReportState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) {
              if (state.isSuccess) {
                UiMessageService.showSuccess(l10n.report_user_success);
                context.goBack();
              } else if (state.isRateLimited) {
                UiMessageService.showError(l10n.report_user_rate_limited);
              } else if (state.isFailed) {
                UiMessageService.showError(state.errorMessage);
              }
            },
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: HorizontalPadding(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ComplaintTypeDropdown(
                          value: _complaintType,
                          onChanged: _onComplaintTypeChanged,
                        ),
                        const Gap(20.0),
                        ComplaintDetailsInput(
                          controller: _detailsController,
                        ),
                        const Gap(30.0),
                        BlocBuilder<ReportBloc, ReportState>(
                          builder: (context, state) {
                            return ActionBtn(
                              onPressed: state.isSubmitting ? null : _onSubmit,
                              anyStateColor: AppColors.darkOrchid.value,
                              text: l10n.report_user_submit,
                            );
                          },
                        ),
                      ],
                    ),
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
