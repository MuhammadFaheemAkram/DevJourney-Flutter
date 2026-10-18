import 'package:dev_journey/domain/model/search.dart';

sealed class SearchEvent {
  const SearchEvent();
}

/// The screen opened: follow the recent searches while it lives.
final class SearchSubscriptionRequested extends SearchEvent {
  const SearchSubscriptionRequested();
}

/// The field changed. Debounced, unless [immediate] (a recent search tapped,
/// the keyboard's Search key) or blank.
final class SearchQueryChanged extends SearchEvent {
  const SearchQueryChanged(this.query, {this.immediate = false});

  final String query;
  final bool immediate;
}

/// A result was opened: remember the query, and open a resource's link
/// (the view navigates to the other kinds).
final class SearchHitOpened extends SearchEvent {
  const SearchHitOpened(this.hit);

  final SearchHit hit;
}

final class SearchRecentSearchesCleared extends SearchEvent {
  const SearchRecentSearchesCleared();
}
