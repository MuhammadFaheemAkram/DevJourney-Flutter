import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/roadmaps/cubit/roadmaps_cubit.dart';
import 'package:dev_journey/features/roadmaps/roadmaps_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class RoadmapsPage extends StatelessWidget {
  const RoadmapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RoadmapsCubit>()..load(),
      child: const RoadmapsView(),
    );
  }
}
