import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/analytics/analytics_view.dart';
import 'package:dev_journey/features/analytics/cubit/analytics_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AnalyticsCubit>()..load(),
      child: const AnalyticsView(),
    );
  }
}
