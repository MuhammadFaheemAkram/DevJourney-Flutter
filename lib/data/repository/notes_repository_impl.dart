import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/guard_write.dart';
import 'package:dev_journey/core/common/id_generator.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/core/database/daos/notes_dao.dart';
import 'package:dev_journey/data/mapper/notes_goals_mappers.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/repository/notes_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  const NotesRepositoryImpl(this._dao, this._ids, this._clock);

  final NotesDao _dao;
  final IdGenerator _ids;
  final Clock _clock;

  @override
  Stream<List<NoteItem>> watchNotes({String query = '', String? topicId}) =>
      _dao
          .watchNotes(query: query, topicId: topicId)
          .map(
            (rows) => [
              for (final (note, topicTitle) in rows)
                NoteItem(note: note.toDomain(), topicTitle: topicTitle),
            ],
          );

  @override
  Future<Note?> findNote(String id) async =>
      (await _dao.findById(id))?.toDomain();

  @override
  Future<Result<Note>> addNote(NoteDraft draft) =>
      guardWrite('Adding a note', () async {
        final now = _clock.now().toUtc();
        final note = Note(
          id: _ids.next('note'),
          title: draft.title,
          content: draft.content,
          topicId: draft.topicId,
          createdAt: now,
          updatedAt: now,
        );
        await _dao.insertNote(note.toCompanion());
        return note;
      });

  @override
  Future<Result<Note>> updateNote(String id, NoteDraft draft) =>
      guardWrite('Updating a note', () async {
        final row = await _dao.findById(id);
        if (row == null) throw const NotFoundException('note');
        final note = row.toDomain().copyWith(
          title: draft.title,
          content: draft.content,
          topicId: draft.topicId,
          updatedAt: _clock.now().toUtc(),
        );
        await _dao.updateNote(note.toRow());
        return note;
      });

  @override
  Future<Result<Note>> deleteNote(String id) =>
      guardWrite('Deleting a note', () async {
        final row = await _dao.deleteReturning(id);
        if (row == null) throw const NotFoundException('note');
        return row.toDomain();
      });

  @override
  Future<Result<void>> restoreNote(Note note) =>
      guardWrite('Restoring a note', () => _dao.insertNote(note.toCompanion()));
}
