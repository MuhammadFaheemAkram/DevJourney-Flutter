import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/resources/cubit/resources_cubit.dart';
import 'package:dev_journey/features/resources/resources_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Resources (from the drawer).
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResourcesCubit>()..load(),
      child: const ResourcesView(),
    );
  }
}
