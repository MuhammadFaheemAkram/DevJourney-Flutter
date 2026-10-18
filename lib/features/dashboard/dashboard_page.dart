import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:dev_journey/features/dashboard/dashboard_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DashboardCubit>()..load(),
      child: const DashboardView(),
    );
  }
}
