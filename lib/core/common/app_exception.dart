/// The app's error vocabulary.
///
/// Every failure that can reach the UI is one of these types, and each carries
/// a user-facing [message], so screens render a small, stable set of error
/// states instead of raw exceptions.
///
/// `sealed` lets the compiler check that a `switch` over an [AppException]
/// handles every subtype.
sealed class AppException implements Exception {
  const AppException(this.message);

  /// Copy that is safe to show to the user.
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// The (fake) network call failed.
final class NetworkException extends AppException {
  const NetworkException()
    : super("Couldn't reach the server. Check your connection and try again.");
}

/// The data could not be decoded (malformed JSON, unexpected types, or a
/// record that points at something that doesn't exist).
final class DataFormatException extends AppException {
  const DataFormatException()
    : super('The learning content looks damaged. Please try again.');
}

/// The item no longer exists (or never did: a stale link).
final class NotFoundException extends AppException {
  /// [what] names the record: "That topic doesn't exist any more."
  const NotFoundException([String what = 'item'])
    : super("That $what doesn't exist any more.");
}

/// Input the form should have caught: the use cases check again.
final class InvalidInputException extends AppException {
  const InvalidInputException(super.message);
}

/// A custom goal already has all its check-ins for this period.
final class GoalAlreadyMetException extends AppException {
  const GoalAlreadyMetException()
    : super('This goal is already met for now. Nice work!');
}

/// Only custom goals take check-ins: the others count completions.
final class AutomaticGoalException extends AppException {
  const AutomaticGoalException()
    : super('This goal counts your completions by itself.');
}

/// Anything unexpected that isn't one of the cases above.
final class UnknownException extends AppException {
  const UnknownException() : super('Something went wrong. Please try again.');
}
