import 'package:dev_journey/domain/model/search.dart';
import 'package:material_ui/material_ui.dart';

/// Text with its search matches in bold, in the primary color. Bold is the
/// signal that doesn't need color; screen readers read the plain text.
class HighlightedTextView extends StatelessWidget {
  const HighlightedTextView({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
  });

  final HighlightedText text;
  final TextStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = style ?? DefaultTextStyle.of(context).style;
    final match = base.copyWith(
      fontWeight: FontWeight.w700,
      color: theme.colorScheme.primary,
    );
    final spans = <TextSpan>[];
    var at = 0;
    for (final (start, end) in text.matches) {
      if (start > at) spans.add(TextSpan(text: text.text.substring(at, start)));
      spans.add(TextSpan(text: text.text.substring(start, end), style: match));
      at = end;
    }
    if (at < text.text.length) {
      spans.add(TextSpan(text: text.text.substring(at)));
    }
    return Text.rich(
      TextSpan(style: base, children: spans),
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
    );
  }
}
