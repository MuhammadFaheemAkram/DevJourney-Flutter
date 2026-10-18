import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:dev_journey/domain/model/catalog.dart';
import 'package:dev_journey/domain/model/challenge_item.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:dev_journey/domain/model/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('ChallengeCard: category, title, difficulty and status', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpThemed(
      ChallengeCard(
        onTap: () => taps++,
        item: const ChallengeItem(
          challenge: Challenge(
            id: 'c',
            title: 'Debounce a stream',
            category: ChallengeCategory.dart,
            difficulty: Difficulty.intermediate,
            prompt: 'p',
            hints: [],
          ),
          progress: ChallengeProgress(status: ChallengeStatus.inProgress),
        ),
      ),
    );

    expect(find.text('DART'), findsOneWidget);
    expect(find.text('Debounce a stream'), findsOneWidget);
    // One button for screen readers, which hears both, in words.
    expect(
      find.bySemanticsLabel(RegExp('Status: In progress')),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(RegExp('Difficulty: Intermediate')),
      findsOneWidget,
    );
    await tester.tap(find.text('Debounce a stream'));
    expect(taps, 1);
  });

  testWidgets('ResourceCard: open and save are separate buttons', (
    tester,
  ) async {
    var opened = 0;
    var saved = 0;
    await tester.pumpThemed(
      ResourceCard(
        onTap: () => opened++,
        onBookmark: () => saved++,
        item: ResourceItem(
          resource: Resource(
            id: 'r',
            title: 'Using streams',
            type: ResourceType.video,
            url: Uri.parse('https://youtube.com/x'),
            source: 'youtube.com',
            estimatedMinutes: 90,
          ),
        ),
      ),
    );

    expect(find.text('Video · youtube.com · 1 h 30 min'), findsOneWidget);
    await tester.tap(find.text('Using streams'));
    await tester.tap(find.byTooltip('Save'));
    expect((opened, saved), (1, 1));
  });

  testWidgets('HighlightedTextView: matches in bold', (tester) async {
    await tester.pumpThemed(
      const HighlightedTextView(
        text: HighlightedText(text: 'Dart streams', matches: [(5, 12)]),
      ),
    );

    final rich = tester.widget<RichText>(find.byType(RichText).last);
    // The leaves: Text.rich wraps the given span in one of its own.
    final spans = <TextSpan>[];
    rich.text.visitChildren((span) {
      if (span is TextSpan && span.text != null) spans.add(span);
      return true;
    });
    expect([for (final span in spans) span.text], ['Dart ', 'streams']);
    expect(spans.last.style?.fontWeight, FontWeight.w700);
    expect(spans.first.style?.fontWeight, isNot(FontWeight.w700));
  });

  testWidgets('SegmentedChoice: chips instead of segments at large text', (
    tester,
  ) async {
    Future<void> pump(double scale) => tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: MediaQuery(
          data: MediaQueryData(textScaler: TextScaler.linear(scale)),
          child: Scaffold(
            body: SegmentedChoice<int>(
              values: const [1, 2, 3],
              labelOf: (value) => '$value',
              selected: 1,
              onSelected: (_) {},
            ),
          ),
        ),
      ),
    );

    await pump(1);
    expect(find.byType(SegmentedButton<int>), findsOneWidget);
    await pump(2);
    expect(find.byType(SegmentedButton<int>), findsNothing);
    expect(find.byType(ChoiceChip), findsNWidgets(3));
  });
}
