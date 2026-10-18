import 'package:dev_journey/core/design_system/theme/app_radius.dart';
import 'package:dev_journey/core/design_system/theme/app_spacing.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:material_ui/material_ui.dart';

/// A note's Markdown, rendered in the app's theme.
///
/// `flutter_markdown_plus` reads its default styles from
/// `package:flutter/material.dart`'s `Theme`, a different class from
/// `material_ui`'s, so it would never find ours and would draw dark text on
/// a dark page. Every style it uses is set here from our theme instead
/// (conventions §11.55). Tapping a link calls [onTapLink] with its target,
/// as written: the caller checks it (https only) before opening it.
class NoteMarkdown extends StatelessWidget {
  const NoteMarkdown({super.key, required this.data, this.onTapLink});

  final String data;
  final ValueChanged<String>? onTapLink;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      styleSheet: noteMarkdownStyle(Theme.of(context)),
      onTapLink: (_, href, _) {
        if (href != null) onTapLink?.call(href);
      },
    );
  }
}

/// The complete style sheet: text, headings, code, quotes, lists, tables
/// and rules, all from [theme].
MarkdownStyleSheet noteMarkdownStyle(ThemeData theme) {
  final text = theme.textTheme;
  final scheme = theme.colorScheme;
  final body = text.bodyLarge!.copyWith(color: scheme.onSurface);
  final code = text.bodyMedium!.copyWith(
    fontFamily: 'monospace',
    fontFamilyFallback: const ['Menlo', 'Courier'],
    color: scheme.onSurface,
    backgroundColor: scheme.surfaceContainerHighest,
  );
  final heading = scheme.onSurface;
  final rounded = BorderRadius.circular(AppRadius.small);
  return MarkdownStyleSheet(
    p: body,
    a: body.copyWith(
      color: scheme.primary,
      decoration: TextDecoration.underline,
      decorationColor: scheme.primary,
    ),
    em: const TextStyle(fontStyle: FontStyle.italic),
    strong: const TextStyle(fontWeight: FontWeight.bold),
    del: TextStyle(
      decoration: TextDecoration.lineThrough,
      decorationColor: scheme.onSurface,
    ),
    h1: text.headlineSmall!.copyWith(color: heading),
    h2: text.titleLarge!.copyWith(color: heading),
    h3: text.titleMedium!.copyWith(color: heading),
    h4: text.titleSmall!.copyWith(color: heading),
    h5: text.titleSmall!.copyWith(color: heading),
    h6: text.titleSmall!.copyWith(color: heading),
    code: code,
    codeblockDecoration: BoxDecoration(
      color: scheme.surfaceContainerHighest,
      borderRadius: rounded,
    ),
    codeblockPadding: const EdgeInsets.all(AppSpacing.small),
    blockquote: body.copyWith(color: scheme.onSurfaceVariant),
    blockquoteDecoration: BoxDecoration(
      color: scheme.surfaceContainerLow,
      border: BorderDirectional(
        start: BorderSide(color: scheme.primary, width: 4),
      ),
    ),
    blockquotePadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.small,
      vertical: AppSpacing.xSmall,
    ),
    listBullet: body,
    checkbox: body.copyWith(color: scheme.primary),
    img: body,
    tableHead: body.copyWith(fontWeight: FontWeight.w600),
    tableBody: body,
    tableBorder: TableBorder.all(color: scheme.outlineVariant),
    horizontalRuleDecoration: BoxDecoration(
      border: Border(top: BorderSide(color: scheme.outlineVariant)),
    ),
    blockSpacing: AppSpacing.xSmall,
  );
}
