import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:material_ui/material_ui.dart';

/// What the picker chose: a topic, or none (`topicId` null). Dismissing the
/// sheet pops nothing, which keeps the current choice.
final class TopicPick {
  const TopicPick(this.topicId);

  final String? topicId;
}

/// Every topic, searchable by its title or its roadmap's, with "No topic"
/// first.
class TopicPickerSheet extends StatefulWidget {
  const TopicPickerSheet({super.key, required this.topics, this.selectedId});

  final List<TopicChoice> topics;
  final String? selectedId;

  @override
  State<TopicPickerSheet> createState() => _TopicPickerSheetState();
}

class _TopicPickerSheetState extends State<TopicPickerSheet> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  List<TopicChoice> get _matches {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return widget.topics;
    return [
      for (final topic in widget.topics)
        if (topic.title.toLowerCase().contains(query) ||
            topic.roadmapTitle.toLowerCase().contains(query))
          topic,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final matches = _matches;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
            child: Text('Attach to a topic', style: theme.textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.medium),
            child: AppSearchField(
              controller: _search,
              hintText: 'Search topics',
              onChanged: (query) => setState(() => _query = query),
              onCleared: () => setState(() => _query = ''),
            ),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                if (_query.trim().isEmpty)
                  _Choice(
                    title: 'No topic',
                    selected: widget.selectedId == null,
                    onTap: () =>
                        Navigator.of(context).pop(const TopicPick(null)),
                  ),
                for (final topic in matches)
                  _Choice(
                    title: topic.title,
                    subtitle: topic.roadmapTitle,
                    selected: topic.id == widget.selectedId,
                    onTap: () => Navigator.of(context).pop(TopicPick(topic.id)),
                  ),
                if (matches.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(AppSpacing.large),
                    child: Text('No topics match', textAlign: TextAlign.center),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Choice extends StatelessWidget {
  const _Choice({
    required this.title,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    return ListTile(
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle),
      selected: selected,
      trailing: selected ? const Icon(Icons.check) : null,
      onTap: onTap,
    );
  }
}
