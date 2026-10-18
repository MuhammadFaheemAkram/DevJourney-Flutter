import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/goals/cubit/goals_cubit.dart';
import 'package:dev_journey/features/goals/goals_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Goals (from the drawer).
class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GoalsCubit>()..load(),
      child: const GoalsView(),
    );
  }
}
