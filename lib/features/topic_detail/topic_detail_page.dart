import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_cubit.dart';
import 'package:dev_journey/features/topic_detail/topic_detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// One topic ([topicId]).
class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({super.key, required this.topicId});

  final String topicId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TopicDetailCubit>(param1: topicId)..load(),
      child: const TopicDetailView(),
    );
  }
}
