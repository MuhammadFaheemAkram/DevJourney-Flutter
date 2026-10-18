import 'package:dev_journey/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';

enum NotesStatus { loading, ready, failure }

@freezed
abstract class NotesState with _$NotesState {
  const factory NotesState({
    required DateTime now,
    @Default(NotesStatus.loading) NotesStatus status,
    @Default(<NoteItem>[]) List<NoteItem> notes,
    @Default('') String query,

    /// The note just deleted, for the Undo SnackBar; [deletedSerial] makes
    /// each deletion distinct.
    Note? deleted,
    @Default(0) int deletedSerial,
    String? errorMessage,
    @Default(0) int errorSerial,
  }) = _NotesState;
}
