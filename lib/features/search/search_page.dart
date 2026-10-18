import 'package:dev_journey/di/injection.dart';
import 'package:dev_journey/features/search/bloc/search_bloc.dart';
import 'package:dev_journey/features/search/bloc/search_event.dart';
import 'package:dev_journey/features/search/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// Global search (from the drawer and app bars).
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SearchBloc>()..add(const SearchSubscriptionRequested()),
      child: const SearchView(),
    );
  }
}
