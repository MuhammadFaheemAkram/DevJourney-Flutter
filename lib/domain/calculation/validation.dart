import 'package:characters/characters.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/note.dart';

// The input rules, shared by the forms (to show the error under a field)
// and the use cases (to refuse what slips past). Each returns `null` when
// the value is fine, or what to fix. Lengths count what the user sees:
// "👩‍💻" is one character, not five UTF-16 units.

String? noteTitleError(String title) {
  final trimmed = title.trim();
  if (trimmed.isEmpty) return 'Give the note a title';
  if (trimmed.characters.length > Note.maxTitleLength) {
    return 'Keep the title under ${Note.maxTitleLength} characters';
  }
  return null;
}

String? noteContentError(String content) =>
    content.characters.length > Note.maxContentLength
    ? 'Notes are limited to ${Note.maxContentLength} characters'
    : null;

String? goalTitleError(String title) {
  final trimmed = title.trim();
  if (trimmed.isEmpty) return 'Give the goal a title';
  if (trimmed.characters.length > Goal.maxTitleLength) {
    return 'Keep the title under ${Goal.maxTitleLength} characters';
  }
  return null;
}

String? goalTargetError(int target) =>
    target < Goal.minTarget || target > Goal.maxTarget
    ? 'Pick a target from ${Goal.minTarget} to ${Goal.maxTarget}'
    : null;
