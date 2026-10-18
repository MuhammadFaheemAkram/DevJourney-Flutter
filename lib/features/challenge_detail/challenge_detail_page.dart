import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/challenge_detail/challenge_detail_view.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// One challenge ([challengeId]).
class ChallengeDetailPage extends StatelessWidget {
  const ChallengeDetailPage({super.key, required this.challengeId});

  final String challengeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChallengeDetailCubit>(param1: challengeId)..load(),
      child: const ChallengeDetailView(),
    );
  }
}
