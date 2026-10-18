import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/core/navigation/app_routes.dart';
import 'package:dev_journey/core/navigation/fallback_close_button.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_cubit.dart';
import 'package:dev_journey/features/challenge_detail/cubit/challenge_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

/// A challenge: the prompt, its status, hints one at a time, and the
/// user's solution notes (saved as they type).
class ChallengeDetailView extends StatelessWidget {
  const ChallengeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChallengeDetailCubit>().state;
    return BlocListener<ChallengeDetailCubit, ChallengeDetailState>(
      listenWhen: (previous, current) =>
          previous.messageSerial != current.messageSerial,
      listener: (context, state) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(state.message ?? ''))),
      child: Scaffold(
        appBar: AppBar(
          leading: fallbackCloseButton(
            context,
            () => const ChallengesRoute().go(context),
          ),
          title: const Text('Challenge'),
        ),
        body: switch (state.status) {
          ChallengeDetailStatus.loading => const LoadingView(),
          ChallengeDetailStatus.notFound => EmptyStateView(
            icon: Icons.search_off,
            title: 'This challenge no longer exists',
            message: 'It may have been removed from the catalog.',
            action: FilledButton.tonal(
              onPressed: () => const ChallengesRoute().go(context),
              child: const Text('See all challenges'),
            ),
          ),
          ChallengeDetailStatus.found => _Details(
            item: state.item!,
            state: state,
          ),
        },
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.item, required this.state});

  final ChallengeItem item;
  final ChallengeDetailState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ChallengeDetailCubit>();
    final challenge = item.challenge;
    final hints = challenge.hints;
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.medium),
      children: [
        Text(
          challenge.category.label.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: AppSpacing.xxSmall),
        Text(challenge.title, style: theme.textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.small),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: DifficultyChip(difficulty: challenge.difficulty),
        ),
        const _Heading('Status'),
        SegmentedChoice<ChallengeStatus>(
          values: ChallengeStatus.values,
          labelOf: (status) => status.label,
          selected: item.status,
          onSelected: cubit.setStatus,
        ),
        const _Heading('The challenge'),
        Text(challenge.prompt, style: theme.textTheme.bodyLarge),
        if (hints.isNotEmpty) ...[
          const _Heading('Hints'),
          for (final (index, hint) in hints.take(state.hintsShown).indexed)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExcludeSemantics(
                    child: Icon(
                      Icons.lightbulb_outline,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xSmall),
                  Expanded(
                    child: Semantics(
                      label: 'Hint ${index + 1}: $hint',
                      excludeSemantics: true,
                      child: Text(hint, style: theme.textTheme.bodyMedium),
                    ),
                  ),
                ],
              ),
            ),
          if (state.hintsShown < hints.length)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: OutlinedButton.icon(
                onPressed: cubit.showNextHint,
                icon: const Icon(Icons.lightbulb_outline),
                label: Text(
                  state.hintsShown == 0
                      ? 'Show a hint (${hints.length} available)'
                      : 'Show the next hint '
                            '(${state.hintsShown + 1} of ${hints.length})',
                ),
              ),
            ),
        ],
        const _Heading('Your solution notes'),
        _SolutionNotes(initial: state.notes, saveStatus: state.notesSave),
      ],
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.large,
        bottom: AppSpacing.xSmall,
      ),
      child: Semantics(
        header: true,
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

/// The notes field. Its controller starts from the saved notes and reports
/// each change; the Cubit decides when to save.
class _SolutionNotes extends StatefulWidget {
  const _SolutionNotes({required this.initial, required this.saveStatus});

  final String initial;
  final NotesSaveStatus saveStatus;

  @override
  State<_SolutionNotes> createState() => _SolutionNotesState();
}

class _SolutionNotesState extends State<_SolutionNotes> {
  late final _controller = TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      minLines: 5,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      onChanged: context.read<ChallengeDetailCubit>().notesChanged,
      decoration: InputDecoration(
        labelText: 'How you solved it',
        alignLabelWithHint: true,
        hintText: 'Your approach, what tripped you up, what to remember',
        helperText: switch (widget.saveStatus) {
          NotesSaveStatus.saved => 'Saved',
          NotesSaveStatus.pending || NotesSaveStatus.saving => 'Saving…',
        },
      ),
    );
  }
}
