import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

/// A Markdown note the user wrote, optionally about a topic.
@freezed
abstract class Note with _$Note {
  const factory Note({
    required String id,
    required String title,

    /// Markdown.
    required String content,
    String? topicId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Note;

  /// In characters as the user sees them (grapheme clusters).
  static const maxTitleLength = 80;
  static const maxContentLength = 20000;
}

/// A note with the title of its topic, for lists.
@freezed
abstract class NoteItem with _$NoteItem {
  const factory NoteItem({required Note note, String? topicTitle}) = _NoteItem;
}

/// What the editor saves.
@freezed
abstract class NoteDraft with _$NoteDraft {
  const factory NoteDraft({
    required String title,
    required String content,
    String? topicId,
  }) = _NoteDraft;
}
