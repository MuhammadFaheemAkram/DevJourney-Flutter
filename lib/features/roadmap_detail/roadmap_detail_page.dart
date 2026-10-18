import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/roadmap_detail/cubit/roadmap_detail_cubit.dart';
import 'package:dev_journey/features/roadmap_detail/roadmap_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// One roadmap's learning path ([roadmapId]).
class RoadmapDetailPage extends StatelessWidget {
  const RoadmapDetailPage({super.key, required this.roadmapId});

  final String roadmapId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RoadmapDetailCubit>(param1: roadmapId)..load(),
      child: const RoadmapDetailView(),
    );
  }
}
