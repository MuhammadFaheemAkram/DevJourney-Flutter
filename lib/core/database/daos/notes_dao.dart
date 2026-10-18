import 'package:dev_journey/core/database/app_database.dart';
import 'package:dev_journey/core/database/tables/catalog_tables.dart';
import 'package:dev_journey/core/database/tables/user_tables.dart';
import 'package:drift/drift.dart';

part 'notes_dao.g.dart';

/// Notes, with their topic's title.
@DriftAccessor(tables: [Notes, Topics])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.attachedDatabase);

  /// Notes, the most recently edited first, with their topic's title;
  /// [query] matches titles and contents (`LIKE`, wildcards escaped, so
  /// "50%" finds "50%"). [topicId] narrows to one topic's notes.
  Stream<List<(NoteRow, String?)>> watchNotes({
    String query = '',
    String? topicId,
  }) {
    final text = query.trim();
    final select =
        this.select(notes).join([
            leftOuterJoin(topics, topics.id.equalsExp(notes.topicId)),
          ])
          // The insertion order breaks ties, so the order never flickers.
          ..orderBy([
            OrderingTerm.desc(notes.updatedAt),
            OrderingTerm.desc(notes.rowId),
          ]);
    final conditions = <Expression<bool>>[
      if (topicId != null) notes.topicId.equals(topicId),
      if (text.isNotEmpty)
        notes.title.like(_pattern(text), escapeChar: r'\') |
            notes.content.like(_pattern(text), escapeChar: r'\'),
    ];
    if (conditions.isNotEmpty) {
      select.where(conditions.reduce((a, b) => a & b));
    }
    return select.watch().map(
      (rows) => [
        for (final row in rows)
          (row.readTable(notes), row.readTableOrNull(topics)?.title),
      ],
    );
  }

  /// `%text%`, with `%`, `_` and the escape character itself escaped.
  static String _pattern(String text) =>
      '%${text.replaceAllMapped(RegExp(r'[%_\\]'), (m) => '\\${m[0]}')}%';

  Future<NoteRow?> findById(String id) =>
      (select(notes)..where((n) => n.id.equals(id))).getSingleOrNull();

  Future<void> insertNote(NotesCompanion note) => into(notes).insert(note);

  Future<bool> updateNote(NoteRow note) => update(notes).replace(note);

  /// Deletes [id] and returns the row as it was (for Undo), or `null`.
  Future<NoteRow?> deleteReturning(String id) async {
    final rows = await (delete(
      notes,
    )..where((n) => n.id.equals(id))).goAndReturn();
    return rows.firstOrNull;
  }
}
