import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/domain/model/goal.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:drift/drift.dart' show Value;

extension NoteRowMapping on NoteRow {
  Note toDomain() => Note(
    id: id,
    title: title,
    content: content,
    topicId: topicId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension NoteMapping on Note {
  NotesCompanion toCompanion() => NotesCompanion.insert(
    id: id,
    title: title,
    content: content,
    topicId: Value(topicId),
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  NoteRow toRow() => NoteRow(
    id: id,
    title: title,
    content: content,
    topicId: topicId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension GoalRowMapping on GoalRow {
  Goal toDomain() => Goal(
    id: id,
    title: title,
    kind: kind,
    period: period,
    target: target,
    createdOn: createdOn,
  );
}
