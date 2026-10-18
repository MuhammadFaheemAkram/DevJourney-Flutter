import 'package:dev_journey/domain/model/search.dart';

/// Global search over roadmaps, topics, notes, resources and challenges.
abstract interface class SearchRepository {
  /// The results for [ftsQuery] (already made safe by `ftsQuery`), grouped
  /// and ranked, kept live.
  Stream<SearchResults> watchResults(String ftsQuery);
}
