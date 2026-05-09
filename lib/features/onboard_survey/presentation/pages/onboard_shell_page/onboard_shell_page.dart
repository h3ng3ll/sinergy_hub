import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/routes/init_router/init_router.dart';
import '../../../domain/use_cases/get_completion_status_use_case.dart';
import '../../../domain/use_cases/set_completion_status_use_case.dart';
import '../../bloc/onboard_bloc/onboard_bloc.dart';

class OnboardShellPage extends StatefulWidget {
  final Widget child;

  const OnboardShellPage({
    super.key,
    required this.child,
  });

  @override
  State<OnboardShellPage> createState() => _OnboardShellPageState();
}

class _OnboardShellPageState extends State<OnboardShellPage> {
  late final OnboardBloc _onboardBloc;

  @override
  void initState() {
    super.initState();
    _onboardBloc =
        OnboardBloc(
          getUserCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
          setUserCompletionStatusUseCase: getIt<SetCompletionStatusUseCase>(),
        )..add(
          OnboardEvent.load(),
        );
  }

  @override
  void dispose() {
    _onboardBloc.close();
    super.dispose();
  }

  void _onStatusChanged(BuildContext context, OnboardState state) {
    if (state.onboardStatus.completeSpecialization) {
      DiscoveryPageRoute().go(
        context,
      );
    } else if (state.onboardStatus.toldAboutYourself) {
      OnboardSurveyPageRoute().go(
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardBloc>.value(
      value: _onboardBloc,
      child: BlocListener<OnboardBloc, OnboardState>(
        listenWhen: (previous, current) =>
            previous.onboardStatus != current.onboardStatus,
        listener: _onStatusChanged,
        child: widget.child,
      ),
    );
  }
}
