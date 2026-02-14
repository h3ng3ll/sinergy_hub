import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          OnboardBloc(
            getUserCompletionStatusUseCase: getIt<GetCompletionStatusUseCase>(),
            setUserCompletionStatusUseCase: getIt<SetCompletionStatusUseCase>(),
          )..add(
            OnboardEvent.load(),
          ),
      child: BlocListener<OnboardBloc, OnboardState>(
        listener: (context, state) {
          if (state.onboardStatus.completeSpecialization) {
            HomePageRoute().go(
              context,
            );
          }
         else if (state.onboardStatus.toldAboutYourself) {
            OnboardSurveyPageRoute().go(
              context,
            );
          }
        },
        child: Container(
          child: widget.child,
        ),
      ),
    );
  }
}
