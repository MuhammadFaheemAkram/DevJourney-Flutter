import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/challenges/challenges_view.dart';
import 'package:dev_journey/features/challenges/cubit/challenges_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChallengesCubit>()..load(),
      child: const ChallengesView(),
    );
  }
}
