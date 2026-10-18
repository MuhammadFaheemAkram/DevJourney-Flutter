import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

/// What a search result points at, in the order the groups are shown.
enum SearchKind { roadmap, topic, note, resource, challenge }

/// A piece of text with the parts that matched the search.
@freezed
abstract class HighlightedText with _$HighlightedText {
  const factory HighlightedText({
    required String text,

    /// `[start, end)` character offsets into [text], in order, not
    /// overlapping.
    @Default(<(int, int)>[]) List<(int start, int end)> matches,
  }) = _HighlightedText;
}

/// One search result.
@freezed
abstract class SearchHit with _$SearchHit {
  const factory SearchHit({
    required SearchKind kind,
    required String id,
    required HighlightedText title,

    /// A few words around the match in the body (a topic's description, a
    /// note's text, a resource's source, a challenge's prompt).
    required HighlightedText snippet,

    /// bm25: lower is better.
    required double rank,
  }) = _SearchHit;
}

/// The results grouped by kind, each group best first.
@freezed
abstract class SearchResults with _$SearchResults {
  const factory SearchResults({
    @Default(<SearchKind, List<SearchHit>>{})
    Map<SearchKind, List<SearchHit>> groups,
  }) = _SearchResults;

  const SearchResults._();

  bool get isEmpty => groups.values.every((hits) => hits.isEmpty);

  int get count => groups.values.fold(0, (sum, hits) => sum + hits.length);
}
