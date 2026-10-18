// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'app_database.dart';

// ignore_for_file: type=lint
class SearchIndex extends Table
    with
        TableInfo<SearchIndex, SearchIndexData>,
        VirtualTableInfo<SearchIndex, SearchIndexData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SearchIndex(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  late final GeneratedColumn<String> refId = GeneratedColumn<String>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [kind, refId, title, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_index';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchIndexData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SearchIndexData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchIndexData(
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ref_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
    );
  }

  @override
  SearchIndex createAlias(String alias) {
    return SearchIndex(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(kind UNINDEXED, ref_id UNINDEXED, title, body, tokenize = \'unicode61 remove_diacritics 2\')';
}

class SearchIndexData extends DataClass implements Insertable<SearchIndexData> {
  final String kind;
  final String refId;
  final String title;
  final String body;
  const SearchIndexData({
    required this.kind,
    required this.refId,
    required this.title,
    required this.body,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['kind'] = Variable<String>(kind);
    map['ref_id'] = Variable<String>(refId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    return map;
  }

  SearchIndexCompanion toCompanion(bool nullToAbsent) {
    return SearchIndexCompanion(
      kind: Value(kind),
      refId: Value(refId),
      title: Value(title),
      body: Value(body),
    );
  }

  factory SearchIndexData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchIndexData(
      kind: serializer.fromJson<String>(json['kind']),
      refId: serializer.fromJson<String>(json['ref_id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'kind': serializer.toJson<String>(kind),
      'ref_id': serializer.toJson<String>(refId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  SearchIndexData copyWith({
    String? kind,
    String? refId,
    String? title,
    String? body,
  }) => SearchIndexData(
    kind: kind ?? this.kind,
    refId: refId ?? this.refId,
    title: title ?? this.title,
    body: body ?? this.body,
  );
  SearchIndexData copyWithCompanion(SearchIndexCompanion data) {
    return SearchIndexData(
      kind: data.kind.present ? data.kind.value : this.kind,
      refId: data.refId.present ? data.refId.value : this.refId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchIndexData(')
          ..write('kind: $kind, ')
          ..write('refId: $refId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(kind, refId, title, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchIndexData &&
          other.kind == this.kind &&
          other.refId == this.refId &&
          other.title == this.title &&
          other.body == this.body);
}

class SearchIndexCompanion extends UpdateCompanion<SearchIndexData> {
  final Value<String> kind;
  final Value<String> refId;
  final Value<String> title;
  final Value<String> body;
  final Value<int> rowid;
  const SearchIndexCompanion({
    this.kind = const Value.absent(),
    this.refId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchIndexCompanion.insert({
    required String kind,
    required String refId,
    required String title,
    required String body,
    this.rowid = const Value.absent(),
  }) : kind = Value(kind),
       refId = Value(refId),
       title = Value(title),
       body = Value(body);
  static Insertable<SearchIndexData> custom({
    Expression<String>? kind,
    Expression<String>? refId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (kind != null) 'kind': kind,
      if (refId != null) 'ref_id': refId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchIndexCompanion copyWith({
    Value<String>? kind,
    Value<String>? refId,
    Value<String>? title,
    Value<String>? body,
    Value<int>? rowid,
  }) {
    return SearchIndexCompanion(
      kind: kind ?? this.kind,
      refId: refId ?? this.refId,
      title: title ?? this.title,
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (refId.present) {
      map['ref_id'] = Variable<String>(refId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchIndexCompanion(')
          ..write('kind: $kind, ')
          ..write('refId: $refId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoadmapsTable extends Roadmaps
    with TableInfo<$RoadmapsTable, RoadmapRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RoadmapCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<RoadmapCategory>($RoadmapsTable.$convertercategory);
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmaps';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoadmapRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoadmapRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoadmapRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      category: $RoadmapsTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $RoadmapsTable createAlias(String alias) {
    return $RoadmapsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RoadmapCategory, String, String>
  $convertercategory = const EnumNameConverter<RoadmapCategory>(
    RoadmapCategory.values,
  );
}

class RoadmapRow extends DataClass implements Insertable<RoadmapRow> {
  final String id;
  final String title;
  final String description;
  final RoadmapCategory category;
  final int sortOrder;
  const RoadmapRow({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    {
      map['category'] = Variable<String>(
        $RoadmapsTable.$convertercategory.toSql(category),
      );
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  RoadmapsCompanion toCompanion(bool nullToAbsent) {
    return RoadmapsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      sortOrder: Value(sortOrder),
    );
  }

  factory RoadmapRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoadmapRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: $RoadmapsTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(
        $RoadmapsTable.$convertercategory.toJson(category),
      ),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  RoadmapRow copyWith({
    String? id,
    String? title,
    String? description,
    RoadmapCategory? category,
    int? sortOrder,
  }) => RoadmapRow(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    category: category ?? this.category,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  RoadmapRow copyWithCompanion(RoadmapsCompanion data) {
    return RoadmapRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, category, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoadmapRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.sortOrder == this.sortOrder);
}

class RoadmapsCompanion extends UpdateCompanion<RoadmapRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<RoadmapCategory> category;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const RoadmapsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapsCompanion.insert({
    required String id,
    required String title,
    required String description,
    required RoadmapCategory category,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       description = Value(description),
       category = Value(category),
       sortOrder = Value(sortOrder);
  static Insertable<RoadmapRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<RoadmapCategory>? category,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return RoadmapsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $RoadmapsTable.$convertercategory.toSql(category.value),
      );
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoadmapSectionsTable extends RoadmapSections
    with TableInfo<$RoadmapSectionsTable, SectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapSectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, roadmapId, title, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmap_sections';
  @override
  VerificationContext validateIntegrity(
    Insertable<SectionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SectionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $RoadmapSectionsTable createAlias(String alias) {
    return $RoadmapSectionsTable(attachedDatabase, alias);
  }
}

class SectionRow extends DataClass implements Insertable<SectionRow> {
  final String id;
  final String roadmapId;
  final String title;
  final int sortOrder;
  const SectionRow({
    required this.id,
    required this.roadmapId,
    required this.title,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roadmap_id'] = Variable<String>(roadmapId);
    map['title'] = Variable<String>(title);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  RoadmapSectionsCompanion toCompanion(bool nullToAbsent) {
    return RoadmapSectionsCompanion(
      id: Value(id),
      roadmapId: Value(roadmapId),
      title: Value(title),
      sortOrder: Value(sortOrder),
    );
  }

  factory SectionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SectionRow(
      id: serializer.fromJson<String>(json['id']),
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      title: serializer.fromJson<String>(json['title']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roadmapId': serializer.toJson<String>(roadmapId),
      'title': serializer.toJson<String>(title),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  SectionRow copyWith({
    String? id,
    String? roadmapId,
    String? title,
    int? sortOrder,
  }) => SectionRow(
    id: id ?? this.id,
    roadmapId: roadmapId ?? this.roadmapId,
    title: title ?? this.title,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  SectionRow copyWithCompanion(RoadmapSectionsCompanion data) {
    return SectionRow(
      id: data.id.present ? data.id.value : this.id,
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      title: data.title.present ? data.title.value : this.title,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SectionRow(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roadmapId, title, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SectionRow &&
          other.id == this.id &&
          other.roadmapId == this.roadmapId &&
          other.title == this.title &&
          other.sortOrder == this.sortOrder);
}

class RoadmapSectionsCompanion extends UpdateCompanion<SectionRow> {
  final Value<String> id;
  final Value<String> roadmapId;
  final Value<String> title;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const RoadmapSectionsCompanion({
    this.id = const Value.absent(),
    this.roadmapId = const Value.absent(),
    this.title = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapSectionsCompanion.insert({
    required String id,
    required String roadmapId,
    required String title,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roadmapId = Value(roadmapId),
       title = Value(title),
       sortOrder = Value(sortOrder);
  static Insertable<SectionRow> custom({
    Expression<String>? id,
    Expression<String>? roadmapId,
    Expression<String>? title,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (title != null) 'title': title,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapSectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? roadmapId,
    Value<String>? title,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return RoadmapSectionsCompanion(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      title: title ?? this.title,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapSectionsCompanion(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, TopicRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _sectionIdMeta = const VerificationMeta(
    'sectionId',
  );
  @override
  late final GeneratedColumn<String> sectionId = GeneratedColumn<String>(
    'section_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmap_sections (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> objectives =
      GeneratedColumn<String>(
        'objectives',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($TopicsTable.$converterobjectives);
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, String> difficulty =
      GeneratedColumn<String>(
        'difficulty',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Difficulty>($TopicsTable.$converterdifficulty);
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    false,
    check: () => ComparableExpr(estimatedMinutes).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roadmapId,
    sectionId,
    title,
    description,
    objectives,
    difficulty,
    estimatedMinutes,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
        _sectionIdMeta,
        sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedMinutesMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopicRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      sectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      objectives: $TopicsTable.$converterobjectives.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}objectives'],
        )!,
      ),
      difficulty: $TopicsTable.$converterdifficulty.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}difficulty'],
        )!,
      ),
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterobjectives =
      const StringListConverter();
  static JsonTypeConverter2<Difficulty, String, String> $converterdifficulty =
      const EnumNameConverter<Difficulty>(Difficulty.values);
}

class TopicRow extends DataClass implements Insertable<TopicRow> {
  final String id;
  final String roadmapId;
  final String sectionId;
  final String title;
  final String description;
  final List<String> objectives;
  final Difficulty difficulty;
  final int estimatedMinutes;
  final int sortOrder;
  const TopicRow({
    required this.id,
    required this.roadmapId,
    required this.sectionId,
    required this.title,
    required this.description,
    required this.objectives,
    required this.difficulty,
    required this.estimatedMinutes,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roadmap_id'] = Variable<String>(roadmapId);
    map['section_id'] = Variable<String>(sectionId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    {
      map['objectives'] = Variable<String>(
        $TopicsTable.$converterobjectives.toSql(objectives),
      );
    }
    {
      map['difficulty'] = Variable<String>(
        $TopicsTable.$converterdifficulty.toSql(difficulty),
      );
    }
    map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      roadmapId: Value(roadmapId),
      sectionId: Value(sectionId),
      title: Value(title),
      description: Value(description),
      objectives: Value(objectives),
      difficulty: Value(difficulty),
      estimatedMinutes: Value(estimatedMinutes),
      sortOrder: Value(sortOrder),
    );
  }

  factory TopicRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicRow(
      id: serializer.fromJson<String>(json['id']),
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      sectionId: serializer.fromJson<String>(json['sectionId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      objectives: serializer.fromJson<List<String>>(json['objectives']),
      difficulty: $TopicsTable.$converterdifficulty.fromJson(
        serializer.fromJson<String>(json['difficulty']),
      ),
      estimatedMinutes: serializer.fromJson<int>(json['estimatedMinutes']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roadmapId': serializer.toJson<String>(roadmapId),
      'sectionId': serializer.toJson<String>(sectionId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'objectives': serializer.toJson<List<String>>(objectives),
      'difficulty': serializer.toJson<String>(
        $TopicsTable.$converterdifficulty.toJson(difficulty),
      ),
      'estimatedMinutes': serializer.toJson<int>(estimatedMinutes),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  TopicRow copyWith({
    String? id,
    String? roadmapId,
    String? sectionId,
    String? title,
    String? description,
    List<String>? objectives,
    Difficulty? difficulty,
    int? estimatedMinutes,
    int? sortOrder,
  }) => TopicRow(
    id: id ?? this.id,
    roadmapId: roadmapId ?? this.roadmapId,
    sectionId: sectionId ?? this.sectionId,
    title: title ?? this.title,
    description: description ?? this.description,
    objectives: objectives ?? this.objectives,
    difficulty: difficulty ?? this.difficulty,
    estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  TopicRow copyWithCompanion(TopicsCompanion data) {
    return TopicRow(
      id: data.id.present ? data.id.value : this.id,
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      objectives: data.objectives.present
          ? data.objectives.value
          : this.objectives,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicRow(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('sectionId: $sectionId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('objectives: $objectives, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roadmapId,
    sectionId,
    title,
    description,
    objectives,
    difficulty,
    estimatedMinutes,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicRow &&
          other.id == this.id &&
          other.roadmapId == this.roadmapId &&
          other.sectionId == this.sectionId &&
          other.title == this.title &&
          other.description == this.description &&
          other.objectives == this.objectives &&
          other.difficulty == this.difficulty &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.sortOrder == this.sortOrder);
}

class TopicsCompanion extends UpdateCompanion<TopicRow> {
  final Value<String> id;
  final Value<String> roadmapId;
  final Value<String> sectionId;
  final Value<String> title;
  final Value<String> description;
  final Value<List<String>> objectives;
  final Value<Difficulty> difficulty;
  final Value<int> estimatedMinutes;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.roadmapId = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.objectives = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
    required String id,
    required String roadmapId,
    required String sectionId,
    required String title,
    required String description,
    required List<String> objectives,
    required Difficulty difficulty,
    required int estimatedMinutes,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roadmapId = Value(roadmapId),
       sectionId = Value(sectionId),
       title = Value(title),
       description = Value(description),
       objectives = Value(objectives),
       difficulty = Value(difficulty),
       estimatedMinutes = Value(estimatedMinutes),
       sortOrder = Value(sortOrder);
  static Insertable<TopicRow> custom({
    Expression<String>? id,
    Expression<String>? roadmapId,
    Expression<String>? sectionId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? objectives,
    Expression<String>? difficulty,
    Expression<int>? estimatedMinutes,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (sectionId != null) 'section_id': sectionId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (objectives != null) 'objectives': objectives,
      if (difficulty != null) 'difficulty': difficulty,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsCompanion copyWith({
    Value<String>? id,
    Value<String>? roadmapId,
    Value<String>? sectionId,
    Value<String>? title,
    Value<String>? description,
    Value<List<String>>? objectives,
    Value<Difficulty>? difficulty,
    Value<int>? estimatedMinutes,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return TopicsCompanion(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      sectionId: sectionId ?? this.sectionId,
      title: title ?? this.title,
      description: description ?? this.description,
      objectives: objectives ?? this.objectives,
      difficulty: difficulty ?? this.difficulty,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<String>(sectionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (objectives.present) {
      map['objectives'] = Variable<String>(
        $TopicsTable.$converterobjectives.toSql(objectives.value),
      );
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(
        $TopicsTable.$converterdifficulty.toSql(difficulty.value),
      );
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('sectionId: $sectionId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('objectives: $objectives, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, NoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topicId,
    title,
    content,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class NoteRow extends DataClass implements Insertable<NoteRow> {
  final String id;
  final String? topicId;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NoteRow({
    required this.id,
    this.topicId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<String>(topicId);
    }
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteRow(
      id: serializer.fromJson<String>(json['id']),
      topicId: serializer.fromJson<String?>(json['topicId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'topicId': serializer.toJson<String?>(topicId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NoteRow copyWith({
    String? id,
    Value<String?> topicId = const Value.absent(),
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => NoteRow(
    id: id ?? this.id,
    topicId: topicId.present ? topicId.value : this.topicId,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  NoteRow copyWithCompanion(NotesCompanion data) {
    return NoteRow(
      id: data.id.present ? data.id.value : this.id,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteRow(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, topicId, title, content, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteRow &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotesCompanion extends UpdateCompanion<NoteRow> {
  final Value<String> id;
  final Value<String?> topicId;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    this.topicId = const Value.absent(),
    required String title,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       content = Value(content),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<NoteRow> custom({
    Expression<String>? id,
    Expression<String>? topicId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topic_id': topicId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? id,
    Value<String?>? topicId,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResourcesTable extends Resources
    with TableInfo<$ResourcesTable, ResourceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ResourceType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ResourceType>($ResourcesTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<Uri, String> url =
      GeneratedColumn<String>(
        'url',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Uri>($ResourcesTable.$converterurl);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    false,
    check: () => ComparableExpr(estimatedMinutes).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    url,
    source,
    estimatedMinutes,
    topicId,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resources';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResourceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_estimatedMinutesMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResourceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResourceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: $ResourcesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      url: $ResourcesTable.$converterurl.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}url'],
        )!,
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ResourcesTable createAlias(String alias) {
    return $ResourcesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ResourceType, String, String> $convertertype =
      const EnumNameConverter<ResourceType>(ResourceType.values);
  static TypeConverter<Uri, String> $converterurl = const UriConverter();
}

class ResourceRow extends DataClass implements Insertable<ResourceRow> {
  final String id;
  final String title;
  final ResourceType type;
  final Uri url;
  final String source;
  final int estimatedMinutes;

  /// The topic it helps with. `SET NULL`: a resource outlives its topic.
  final String? topicId;
  final int sortOrder;
  const ResourceRow({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
    required this.source,
    required this.estimatedMinutes,
    this.topicId,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    {
      map['type'] = Variable<String>(
        $ResourcesTable.$convertertype.toSql(type),
      );
    }
    {
      map['url'] = Variable<String>($ResourcesTable.$converterurl.toSql(url));
    }
    map['source'] = Variable<String>(source);
    map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<String>(topicId);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ResourcesCompanion toCompanion(bool nullToAbsent) {
    return ResourcesCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      url: Value(url),
      source: Value(source),
      estimatedMinutes: Value(estimatedMinutes),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      sortOrder: Value(sortOrder),
    );
  }

  factory ResourceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResourceRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: $ResourcesTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      url: serializer.fromJson<Uri>(json['url']),
      source: serializer.fromJson<String>(json['source']),
      estimatedMinutes: serializer.fromJson<int>(json['estimatedMinutes']),
      topicId: serializer.fromJson<String?>(json['topicId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(
        $ResourcesTable.$convertertype.toJson(type),
      ),
      'url': serializer.toJson<Uri>(url),
      'source': serializer.toJson<String>(source),
      'estimatedMinutes': serializer.toJson<int>(estimatedMinutes),
      'topicId': serializer.toJson<String?>(topicId),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ResourceRow copyWith({
    String? id,
    String? title,
    ResourceType? type,
    Uri? url,
    String? source,
    int? estimatedMinutes,
    Value<String?> topicId = const Value.absent(),
    int? sortOrder,
  }) => ResourceRow(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    url: url ?? this.url,
    source: source ?? this.source,
    estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
    topicId: topicId.present ? topicId.value : this.topicId,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ResourceRow copyWithCompanion(ResourcesCompanion data) {
    return ResourceRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      url: data.url.present ? data.url.value : this.url,
      source: data.source.present ? data.source.value : this.source,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResourceRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('source: $source, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('topicId: $topicId, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    type,
    url,
    source,
    estimatedMinutes,
    topicId,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResourceRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.url == this.url &&
          other.source == this.source &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.topicId == this.topicId &&
          other.sortOrder == this.sortOrder);
}

class ResourcesCompanion extends UpdateCompanion<ResourceRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<ResourceType> type;
  final Value<Uri> url;
  final Value<String> source;
  final Value<int> estimatedMinutes;
  final Value<String?> topicId;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const ResourcesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.url = const Value.absent(),
    this.source = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.topicId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResourcesCompanion.insert({
    required String id,
    required String title,
    required ResourceType type,
    required Uri url,
    required String source,
    required int estimatedMinutes,
    this.topicId = const Value.absent(),
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       type = Value(type),
       url = Value(url),
       source = Value(source),
       estimatedMinutes = Value(estimatedMinutes),
       sortOrder = Value(sortOrder);
  static Insertable<ResourceRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? url,
    Expression<String>? source,
    Expression<int>? estimatedMinutes,
    Expression<String>? topicId,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (source != null) 'source': source,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (topicId != null) 'topic_id': topicId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<ResourceType>? type,
    Value<Uri>? url,
    Value<String>? source,
    Value<int>? estimatedMinutes,
    Value<String?>? topicId,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return ResourcesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      url: url ?? this.url,
      source: source ?? this.source,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      topicId: topicId ?? this.topicId,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ResourcesTable.$convertertype.toSql(type.value),
      );
    }
    if (url.present) {
      map['url'] = Variable<String>(
        $ResourcesTable.$converterurl.toSql(url.value),
      );
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResourcesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('url: $url, ')
          ..write('source: $source, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('topicId: $topicId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChallengesTable extends Challenges
    with TableInfo<$ChallengesTable, ChallengeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChallengesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ChallengeCategory, String>
  category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ChallengeCategory>($ChallengesTable.$convertercategory);
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, String> difficulty =
      GeneratedColumn<String>(
        'difficulty',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Difficulty>($ChallengesTable.$converterdifficulty);
  static const VerificationMeta _promptMeta = const VerificationMeta('prompt');
  @override
  late final GeneratedColumn<String> prompt = GeneratedColumn<String>(
    'prompt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> hints =
      GeneratedColumn<String>(
        'hints',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ChallengesTable.$converterhints);
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    category,
    difficulty,
    prompt,
    hints,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'challenges';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChallengeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('prompt')) {
      context.handle(
        _promptMeta,
        prompt.isAcceptableOrUnknown(data['prompt']!, _promptMeta),
      );
    } else if (isInserting) {
      context.missing(_promptMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChallengeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChallengeRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      category: $ChallengesTable.$convertercategory.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}category'],
        )!,
      ),
      difficulty: $ChallengesTable.$converterdifficulty.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}difficulty'],
        )!,
      ),
      prompt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt'],
      )!,
      hints: $ChallengesTable.$converterhints.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}hints'],
        )!,
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ChallengesTable createAlias(String alias) {
    return $ChallengesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ChallengeCategory, String, String>
  $convertercategory = const EnumNameConverter<ChallengeCategory>(
    ChallengeCategory.values,
  );
  static JsonTypeConverter2<Difficulty, String, String> $converterdifficulty =
      const EnumNameConverter<Difficulty>(Difficulty.values);
  static TypeConverter<List<String>, String> $converterhints =
      const StringListConverter();
}

class ChallengeRow extends DataClass implements Insertable<ChallengeRow> {
  final String id;
  final String title;
  final ChallengeCategory category;
  final Difficulty difficulty;
  final String prompt;
  final List<String> hints;
  final int sortOrder;
  const ChallengeRow({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.prompt,
    required this.hints,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    {
      map['category'] = Variable<String>(
        $ChallengesTable.$convertercategory.toSql(category),
      );
    }
    {
      map['difficulty'] = Variable<String>(
        $ChallengesTable.$converterdifficulty.toSql(difficulty),
      );
    }
    map['prompt'] = Variable<String>(prompt);
    {
      map['hints'] = Variable<String>(
        $ChallengesTable.$converterhints.toSql(hints),
      );
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ChallengesCompanion toCompanion(bool nullToAbsent) {
    return ChallengesCompanion(
      id: Value(id),
      title: Value(title),
      category: Value(category),
      difficulty: Value(difficulty),
      prompt: Value(prompt),
      hints: Value(hints),
      sortOrder: Value(sortOrder),
    );
  }

  factory ChallengeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChallengeRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      category: $ChallengesTable.$convertercategory.fromJson(
        serializer.fromJson<String>(json['category']),
      ),
      difficulty: $ChallengesTable.$converterdifficulty.fromJson(
        serializer.fromJson<String>(json['difficulty']),
      ),
      prompt: serializer.fromJson<String>(json['prompt']),
      hints: serializer.fromJson<List<String>>(json['hints']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(
        $ChallengesTable.$convertercategory.toJson(category),
      ),
      'difficulty': serializer.toJson<String>(
        $ChallengesTable.$converterdifficulty.toJson(difficulty),
      ),
      'prompt': serializer.toJson<String>(prompt),
      'hints': serializer.toJson<List<String>>(hints),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ChallengeRow copyWith({
    String? id,
    String? title,
    ChallengeCategory? category,
    Difficulty? difficulty,
    String? prompt,
    List<String>? hints,
    int? sortOrder,
  }) => ChallengeRow(
    id: id ?? this.id,
    title: title ?? this.title,
    category: category ?? this.category,
    difficulty: difficulty ?? this.difficulty,
    prompt: prompt ?? this.prompt,
    hints: hints ?? this.hints,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ChallengeRow copyWithCompanion(ChallengesCompanion data) {
    return ChallengeRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      prompt: data.prompt.present ? data.prompt.value : this.prompt,
      hints: data.hints.present ? data.hints.value : this.hints,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChallengeRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('difficulty: $difficulty, ')
          ..write('prompt: $prompt, ')
          ..write('hints: $hints, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, category, difficulty, prompt, hints, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChallengeRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.category == this.category &&
          other.difficulty == this.difficulty &&
          other.prompt == this.prompt &&
          other.hints == this.hints &&
          other.sortOrder == this.sortOrder);
}

class ChallengesCompanion extends UpdateCompanion<ChallengeRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<ChallengeCategory> category;
  final Value<Difficulty> difficulty;
  final Value<String> prompt;
  final Value<List<String>> hints;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const ChallengesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.prompt = const Value.absent(),
    this.hints = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChallengesCompanion.insert({
    required String id,
    required String title,
    required ChallengeCategory category,
    required Difficulty difficulty,
    required String prompt,
    required List<String> hints,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       category = Value(category),
       difficulty = Value(difficulty),
       prompt = Value(prompt),
       hints = Value(hints),
       sortOrder = Value(sortOrder);
  static Insertable<ChallengeRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? difficulty,
    Expression<String>? prompt,
    Expression<String>? hints,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (difficulty != null) 'difficulty': difficulty,
      if (prompt != null) 'prompt': prompt,
      if (hints != null) 'hints': hints,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChallengesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<ChallengeCategory>? category,
    Value<Difficulty>? difficulty,
    Value<String>? prompt,
    Value<List<String>>? hints,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return ChallengesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      prompt: prompt ?? this.prompt,
      hints: hints ?? this.hints,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(
        $ChallengesTable.$convertercategory.toSql(category.value),
      );
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(
        $ChallengesTable.$converterdifficulty.toSql(difficulty.value),
      );
    }
    if (prompt.present) {
      map['prompt'] = Variable<String>(prompt.value);
    }
    if (hints.present) {
      map['hints'] = Variable<String>(
        $ChallengesTable.$converterhints.toSql(hints.value),
      );
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChallengesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('difficulty: $difficulty, ')
          ..write('prompt: $prompt, ')
          ..write('hints: $hints, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicProgressTable extends TopicProgress
    with TableInfo<$TopicProgressTable, TopicProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CalendarDate, int> completedOn =
      GeneratedColumn<int>(
        'completed_on',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CalendarDate>($TopicProgressTable.$convertercompletedOn);
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [topicId, completedOn, completedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicProgressRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {topicId};
  @override
  TopicProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicProgressRow(
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      completedOn: $TopicProgressTable.$convertercompletedOn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}completed_on'],
        )!,
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
    );
  }

  @override
  $TopicProgressTable createAlias(String alias) {
    return $TopicProgressTable(attachedDatabase, alias);
  }

  static TypeConverter<CalendarDate, int> $convertercompletedOn =
      const CalendarDateConverter();
}

class TopicProgressRow extends DataClass
    implements Insertable<TopicProgressRow> {
  final String topicId;
  final CalendarDate completedOn;
  final DateTime completedAt;
  const TopicProgressRow({
    required this.topicId,
    required this.completedOn,
    required this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['topic_id'] = Variable<String>(topicId);
    {
      map['completed_on'] = Variable<int>(
        $TopicProgressTable.$convertercompletedOn.toSql(completedOn),
      );
    }
    map['completed_at'] = Variable<DateTime>(completedAt);
    return map;
  }

  TopicProgressCompanion toCompanion(bool nullToAbsent) {
    return TopicProgressCompanion(
      topicId: Value(topicId),
      completedOn: Value(completedOn),
      completedAt: Value(completedAt),
    );
  }

  factory TopicProgressRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicProgressRow(
      topicId: serializer.fromJson<String>(json['topicId']),
      completedOn: serializer.fromJson<CalendarDate>(json['completedOn']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'topicId': serializer.toJson<String>(topicId),
      'completedOn': serializer.toJson<CalendarDate>(completedOn),
      'completedAt': serializer.toJson<DateTime>(completedAt),
    };
  }

  TopicProgressRow copyWith({
    String? topicId,
    CalendarDate? completedOn,
    DateTime? completedAt,
  }) => TopicProgressRow(
    topicId: topicId ?? this.topicId,
    completedOn: completedOn ?? this.completedOn,
    completedAt: completedAt ?? this.completedAt,
  );
  TopicProgressRow copyWithCompanion(TopicProgressCompanion data) {
    return TopicProgressRow(
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      completedOn: data.completedOn.present
          ? data.completedOn.value
          : this.completedOn,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressRow(')
          ..write('topicId: $topicId, ')
          ..write('completedOn: $completedOn, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(topicId, completedOn, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicProgressRow &&
          other.topicId == this.topicId &&
          other.completedOn == this.completedOn &&
          other.completedAt == this.completedAt);
}

class TopicProgressCompanion extends UpdateCompanion<TopicProgressRow> {
  final Value<String> topicId;
  final Value<CalendarDate> completedOn;
  final Value<DateTime> completedAt;
  final Value<int> rowid;
  const TopicProgressCompanion({
    this.topicId = const Value.absent(),
    this.completedOn = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicProgressCompanion.insert({
    required String topicId,
    required CalendarDate completedOn,
    required DateTime completedAt,
    this.rowid = const Value.absent(),
  }) : topicId = Value(topicId),
       completedOn = Value(completedOn),
       completedAt = Value(completedAt);
  static Insertable<TopicProgressRow> custom({
    Expression<String>? topicId,
    Expression<int>? completedOn,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (topicId != null) 'topic_id': topicId,
      if (completedOn != null) 'completed_on': completedOn,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicProgressCompanion copyWith({
    Value<String>? topicId,
    Value<CalendarDate>? completedOn,
    Value<DateTime>? completedAt,
    Value<int>? rowid,
  }) {
    return TopicProgressCompanion(
      topicId: topicId ?? this.topicId,
      completedOn: completedOn ?? this.completedOn,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (completedOn.present) {
      map['completed_on'] = Variable<int>(
        $TopicProgressTable.$convertercompletedOn.toSql(completedOn.value),
      );
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicProgressCompanion(')
          ..write('topicId: $topicId, ')
          ..write('completedOn: $completedOn, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TopicBookmarksTable extends TopicBookmarks
    with TableInfo<$TopicBookmarksTable, TopicBookmarkRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicBookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
    'topic_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [topicId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topic_bookmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicBookmarkRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {topicId};
  @override
  TopicBookmarkRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicBookmarkRow(
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TopicBookmarksTable createAlias(String alias) {
    return $TopicBookmarksTable(attachedDatabase, alias);
  }
}

class TopicBookmarkRow extends DataClass
    implements Insertable<TopicBookmarkRow> {
  final String topicId;
  final DateTime createdAt;
  const TopicBookmarkRow({required this.topicId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['topic_id'] = Variable<String>(topicId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TopicBookmarksCompanion toCompanion(bool nullToAbsent) {
    return TopicBookmarksCompanion(
      topicId: Value(topicId),
      createdAt: Value(createdAt),
    );
  }

  factory TopicBookmarkRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicBookmarkRow(
      topicId: serializer.fromJson<String>(json['topicId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'topicId': serializer.toJson<String>(topicId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TopicBookmarkRow copyWith({String? topicId, DateTime? createdAt}) =>
      TopicBookmarkRow(
        topicId: topicId ?? this.topicId,
        createdAt: createdAt ?? this.createdAt,
      );
  TopicBookmarkRow copyWithCompanion(TopicBookmarksCompanion data) {
    return TopicBookmarkRow(
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicBookmarkRow(')
          ..write('topicId: $topicId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(topicId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicBookmarkRow &&
          other.topicId == this.topicId &&
          other.createdAt == this.createdAt);
}

class TopicBookmarksCompanion extends UpdateCompanion<TopicBookmarkRow> {
  final Value<String> topicId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TopicBookmarksCompanion({
    this.topicId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicBookmarksCompanion.insert({
    required String topicId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : topicId = Value(topicId),
       createdAt = Value(createdAt);
  static Insertable<TopicBookmarkRow> custom({
    Expression<String>? topicId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (topicId != null) 'topic_id': topicId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicBookmarksCompanion copyWith({
    Value<String>? topicId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TopicBookmarksCompanion(
      topicId: topicId ?? this.topicId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicBookmarksCompanion(')
          ..write('topicId: $topicId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResourceBookmarksTable extends ResourceBookmarks
    with TableInfo<$ResourceBookmarksTable, ResourceBookmarkRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResourceBookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _resourceIdMeta = const VerificationMeta(
    'resourceId',
  );
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES resources (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [resourceId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resource_bookmarks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResourceBookmarkRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('resource_id')) {
      context.handle(
        _resourceIdMeta,
        resourceId.isAcceptableOrUnknown(data['resource_id']!, _resourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {resourceId};
  @override
  ResourceBookmarkRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResourceBookmarkRow(
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ResourceBookmarksTable createAlias(String alias) {
    return $ResourceBookmarksTable(attachedDatabase, alias);
  }
}

class ResourceBookmarkRow extends DataClass
    implements Insertable<ResourceBookmarkRow> {
  final String resourceId;
  final DateTime createdAt;
  const ResourceBookmarkRow({
    required this.resourceId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['resource_id'] = Variable<String>(resourceId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ResourceBookmarksCompanion toCompanion(bool nullToAbsent) {
    return ResourceBookmarksCompanion(
      resourceId: Value(resourceId),
      createdAt: Value(createdAt),
    );
  }

  factory ResourceBookmarkRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResourceBookmarkRow(
      resourceId: serializer.fromJson<String>(json['resourceId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'resourceId': serializer.toJson<String>(resourceId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ResourceBookmarkRow copyWith({String? resourceId, DateTime? createdAt}) =>
      ResourceBookmarkRow(
        resourceId: resourceId ?? this.resourceId,
        createdAt: createdAt ?? this.createdAt,
      );
  ResourceBookmarkRow copyWithCompanion(ResourceBookmarksCompanion data) {
    return ResourceBookmarkRow(
      resourceId: data.resourceId.present
          ? data.resourceId.value
          : this.resourceId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResourceBookmarkRow(')
          ..write('resourceId: $resourceId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(resourceId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResourceBookmarkRow &&
          other.resourceId == this.resourceId &&
          other.createdAt == this.createdAt);
}

class ResourceBookmarksCompanion extends UpdateCompanion<ResourceBookmarkRow> {
  final Value<String> resourceId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ResourceBookmarksCompanion({
    this.resourceId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResourceBookmarksCompanion.insert({
    required String resourceId,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : resourceId = Value(resourceId),
       createdAt = Value(createdAt);
  static Insertable<ResourceBookmarkRow> custom({
    Expression<String>? resourceId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (resourceId != null) 'resource_id': resourceId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResourceBookmarksCompanion copyWith({
    Value<String>? resourceId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ResourceBookmarksCompanion(
      resourceId: resourceId ?? this.resourceId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResourceBookmarksCompanion(')
          ..write('resourceId: $resourceId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, GoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GoalKind, String> kind =
      GeneratedColumn<String>(
        'kind',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<GoalKind>($GoalsTable.$converterkind);
  @override
  late final GeneratedColumnWithTypeConverter<GoalPeriod, String> period =
      GeneratedColumn<String>(
        'period',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<GoalPeriod>($GoalsTable.$converterperiod);
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<int> target = GeneratedColumn<int>(
    'target',
    aliasedName,
    false,
    check: () => ComparableExpr(target).isBetweenValues(1, 50),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CalendarDate, int> createdOn =
      GeneratedColumn<int>(
        'created_on',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CalendarDate>($GoalsTable.$convertercreatedOn);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    kind,
    period,
    target,
    createdOn,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      kind: $GoalsTable.$converterkind.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}kind'],
        )!,
      ),
      period: $GoalsTable.$converterperiod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}period'],
        )!,
      ),
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target'],
      )!,
      createdOn: $GoalsTable.$convertercreatedOn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}created_on'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<GoalKind, String, String> $converterkind =
      const EnumNameConverter<GoalKind>(GoalKind.values);
  static JsonTypeConverter2<GoalPeriod, String, String> $converterperiod =
      const EnumNameConverter<GoalPeriod>(GoalPeriod.values);
  static TypeConverter<CalendarDate, int> $convertercreatedOn =
      const CalendarDateConverter();
}

class GoalRow extends DataClass implements Insertable<GoalRow> {
  final String id;
  final String title;
  final GoalKind kind;
  final GoalPeriod period;
  final int target;
  final CalendarDate createdOn;
  final DateTime createdAt;
  const GoalRow({
    required this.id,
    required this.title,
    required this.kind,
    required this.period,
    required this.target,
    required this.createdOn,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    {
      map['kind'] = Variable<String>($GoalsTable.$converterkind.toSql(kind));
    }
    {
      map['period'] = Variable<String>(
        $GoalsTable.$converterperiod.toSql(period),
      );
    }
    map['target'] = Variable<int>(target);
    {
      map['created_on'] = Variable<int>(
        $GoalsTable.$convertercreatedOn.toSql(createdOn),
      );
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      title: Value(title),
      kind: Value(kind),
      period: Value(period),
      target: Value(target),
      createdOn: Value(createdOn),
      createdAt: Value(createdAt),
    );
  }

  factory GoalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      kind: $GoalsTable.$converterkind.fromJson(
        serializer.fromJson<String>(json['kind']),
      ),
      period: $GoalsTable.$converterperiod.fromJson(
        serializer.fromJson<String>(json['period']),
      ),
      target: serializer.fromJson<int>(json['target']),
      createdOn: serializer.fromJson<CalendarDate>(json['createdOn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'kind': serializer.toJson<String>(
        $GoalsTable.$converterkind.toJson(kind),
      ),
      'period': serializer.toJson<String>(
        $GoalsTable.$converterperiod.toJson(period),
      ),
      'target': serializer.toJson<int>(target),
      'createdOn': serializer.toJson<CalendarDate>(createdOn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GoalRow copyWith({
    String? id,
    String? title,
    GoalKind? kind,
    GoalPeriod? period,
    int? target,
    CalendarDate? createdOn,
    DateTime? createdAt,
  }) => GoalRow(
    id: id ?? this.id,
    title: title ?? this.title,
    kind: kind ?? this.kind,
    period: period ?? this.period,
    target: target ?? this.target,
    createdOn: createdOn ?? this.createdOn,
    createdAt: createdAt ?? this.createdAt,
  );
  GoalRow copyWithCompanion(GoalsCompanion data) {
    return GoalRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      kind: data.kind.present ? data.kind.value : this.kind,
      period: data.period.present ? data.period.value : this.period,
      target: data.target.present ? data.target.value : this.target,
      createdOn: data.createdOn.present ? data.createdOn.value : this.createdOn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('kind: $kind, ')
          ..write('period: $period, ')
          ..write('target: $target, ')
          ..write('createdOn: $createdOn, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, kind, period, target, createdOn, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.kind == this.kind &&
          other.period == this.period &&
          other.target == this.target &&
          other.createdOn == this.createdOn &&
          other.createdAt == this.createdAt);
}

class GoalsCompanion extends UpdateCompanion<GoalRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<GoalKind> kind;
  final Value<GoalPeriod> period;
  final Value<int> target;
  final Value<CalendarDate> createdOn;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.kind = const Value.absent(),
    this.period = const Value.absent(),
    this.target = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String title,
    required GoalKind kind,
    required GoalPeriod period,
    required int target,
    required CalendarDate createdOn,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       kind = Value(kind),
       period = Value(period),
       target = Value(target),
       createdOn = Value(createdOn),
       createdAt = Value(createdAt);
  static Insertable<GoalRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? kind,
    Expression<String>? period,
    Expression<int>? target,
    Expression<int>? createdOn,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (kind != null) 'kind': kind,
      if (period != null) 'period': period,
      if (target != null) 'target': target,
      if (createdOn != null) 'created_on': createdOn,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<GoalKind>? kind,
    Value<GoalPeriod>? period,
    Value<int>? target,
    Value<CalendarDate>? createdOn,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      kind: kind ?? this.kind,
      period: period ?? this.period,
      target: target ?? this.target,
      createdOn: createdOn ?? this.createdOn,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(
        $GoalsTable.$converterkind.toSql(kind.value),
      );
    }
    if (period.present) {
      map['period'] = Variable<String>(
        $GoalsTable.$converterperiod.toSql(period.value),
      );
    }
    if (target.present) {
      map['target'] = Variable<int>(target.value);
    }
    if (createdOn.present) {
      map['created_on'] = Variable<int>(
        $GoalsTable.$convertercreatedOn.toSql(createdOn.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('kind: $kind, ')
          ..write('period: $period, ')
          ..write('target: $target, ')
          ..write('createdOn: $createdOn, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalCheckInsTable extends GoalCheckIns
    with TableInfo<$GoalCheckInsTable, GoalCheckInRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalCheckInsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CalendarDate, int> day =
      GeneratedColumn<int>(
        'day',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CalendarDate>($GoalCheckInsTable.$converterday);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, goalId, day, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_check_ins';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalCheckInRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalCheckInRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalCheckInRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_id'],
      )!,
      day: $GoalCheckInsTable.$converterday.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}day'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalCheckInsTable createAlias(String alias) {
    return $GoalCheckInsTable(attachedDatabase, alias);
  }

  static TypeConverter<CalendarDate, int> $converterday =
      const CalendarDateConverter();
}

class GoalCheckInRow extends DataClass implements Insertable<GoalCheckInRow> {
  final int id;
  final String goalId;
  final CalendarDate day;
  final DateTime createdAt;
  const GoalCheckInRow({
    required this.id,
    required this.goalId,
    required this.day,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['goal_id'] = Variable<String>(goalId);
    {
      map['day'] = Variable<int>($GoalCheckInsTable.$converterday.toSql(day));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalCheckInsCompanion toCompanion(bool nullToAbsent) {
    return GoalCheckInsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      day: Value(day),
      createdAt: Value(createdAt),
    );
  }

  factory GoalCheckInRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalCheckInRow(
      id: serializer.fromJson<int>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      day: serializer.fromJson<CalendarDate>(json['day']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'goalId': serializer.toJson<String>(goalId),
      'day': serializer.toJson<CalendarDate>(day),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GoalCheckInRow copyWith({
    int? id,
    String? goalId,
    CalendarDate? day,
    DateTime? createdAt,
  }) => GoalCheckInRow(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    day: day ?? this.day,
    createdAt: createdAt ?? this.createdAt,
  );
  GoalCheckInRow copyWithCompanion(GoalCheckInsCompanion data) {
    return GoalCheckInRow(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      day: data.day.present ? data.day.value : this.day,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckInRow(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('day: $day, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, day, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalCheckInRow &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.day == this.day &&
          other.createdAt == this.createdAt);
}

class GoalCheckInsCompanion extends UpdateCompanion<GoalCheckInRow> {
  final Value<int> id;
  final Value<String> goalId;
  final Value<CalendarDate> day;
  final Value<DateTime> createdAt;
  const GoalCheckInsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.day = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GoalCheckInsCompanion.insert({
    this.id = const Value.absent(),
    required String goalId,
    required CalendarDate day,
    required DateTime createdAt,
  }) : goalId = Value(goalId),
       day = Value(day),
       createdAt = Value(createdAt);
  static Insertable<GoalCheckInRow> custom({
    Expression<int>? id,
    Expression<String>? goalId,
    Expression<int>? day,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (day != null) 'day': day,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GoalCheckInsCompanion copyWith({
    Value<int>? id,
    Value<String>? goalId,
    Value<CalendarDate>? day,
    Value<DateTime>? createdAt,
  }) {
    return GoalCheckInsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      day: day ?? this.day,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(
        $GoalCheckInsTable.$converterday.toSql(day.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCheckInsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('day: $day, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ChallengeStatesTable extends ChallengeStates
    with TableInfo<$ChallengeStatesTable, ChallengeStateRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChallengeStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _challengeIdMeta = const VerificationMeta(
    'challengeId',
  );
  @override
  late final GeneratedColumn<String> challengeId = GeneratedColumn<String>(
    'challenge_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES challenges (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ChallengeStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ChallengeStatus>($ChallengeStatesTable.$converterstatus);
  static const VerificationMeta _solutionNotesMeta = const VerificationMeta(
    'solutionNotes',
  );
  @override
  late final GeneratedColumn<String> solutionNotes = GeneratedColumn<String>(
    'solution_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CalendarDate?, int> completedOn =
      GeneratedColumn<int>(
        'completed_on',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<CalendarDate?>(
        $ChallengeStatesTable.$convertercompletedOnn,
      );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    challengeId,
    status,
    solutionNotes,
    startedAt,
    completedOn,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'challenge_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChallengeStateRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('challenge_id')) {
      context.handle(
        _challengeIdMeta,
        challengeId.isAcceptableOrUnknown(
          data['challenge_id']!,
          _challengeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_challengeIdMeta);
    }
    if (data.containsKey('solution_notes')) {
      context.handle(
        _solutionNotesMeta,
        solutionNotes.isAcceptableOrUnknown(
          data['solution_notes']!,
          _solutionNotesMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {challengeId};
  @override
  ChallengeStateRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChallengeStateRow(
      challengeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}challenge_id'],
      )!,
      status: $ChallengeStatesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      solutionNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}solution_notes'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      ),
      completedOn: $ChallengeStatesTable.$convertercompletedOnn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}completed_on'],
        ),
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ChallengeStatesTable createAlias(String alias) {
    return $ChallengeStatesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ChallengeStatus, String, String> $converterstatus =
      const EnumNameConverter<ChallengeStatus>(ChallengeStatus.values);
  static TypeConverter<CalendarDate, int> $convertercompletedOn =
      const CalendarDateConverter();
  static TypeConverter<CalendarDate?, int?> $convertercompletedOnn =
      NullAwareTypeConverter.wrap($convertercompletedOn);
}

class ChallengeStateRow extends DataClass
    implements Insertable<ChallengeStateRow> {
  final String challengeId;
  final ChallengeStatus status;
  final String solutionNotes;
  final DateTime? startedAt;
  final CalendarDate? completedOn;
  final DateTime updatedAt;
  const ChallengeStateRow({
    required this.challengeId,
    required this.status,
    required this.solutionNotes,
    this.startedAt,
    this.completedOn,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['challenge_id'] = Variable<String>(challengeId);
    {
      map['status'] = Variable<String>(
        $ChallengeStatesTable.$converterstatus.toSql(status),
      );
    }
    map['solution_notes'] = Variable<String>(solutionNotes);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedOn != null) {
      map['completed_on'] = Variable<int>(
        $ChallengeStatesTable.$convertercompletedOnn.toSql(completedOn),
      );
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ChallengeStatesCompanion toCompanion(bool nullToAbsent) {
    return ChallengeStatesCompanion(
      challengeId: Value(challengeId),
      status: Value(status),
      solutionNotes: Value(solutionNotes),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedOn: completedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(completedOn),
      updatedAt: Value(updatedAt),
    );
  }

  factory ChallengeStateRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChallengeStateRow(
      challengeId: serializer.fromJson<String>(json['challengeId']),
      status: $ChallengeStatesTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      solutionNotes: serializer.fromJson<String>(json['solutionNotes']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedOn: serializer.fromJson<CalendarDate?>(json['completedOn']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'challengeId': serializer.toJson<String>(challengeId),
      'status': serializer.toJson<String>(
        $ChallengeStatesTable.$converterstatus.toJson(status),
      ),
      'solutionNotes': serializer.toJson<String>(solutionNotes),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedOn': serializer.toJson<CalendarDate?>(completedOn),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ChallengeStateRow copyWith({
    String? challengeId,
    ChallengeStatus? status,
    String? solutionNotes,
    Value<DateTime?> startedAt = const Value.absent(),
    Value<CalendarDate?> completedOn = const Value.absent(),
    DateTime? updatedAt,
  }) => ChallengeStateRow(
    challengeId: challengeId ?? this.challengeId,
    status: status ?? this.status,
    solutionNotes: solutionNotes ?? this.solutionNotes,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    completedOn: completedOn.present ? completedOn.value : this.completedOn,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ChallengeStateRow copyWithCompanion(ChallengeStatesCompanion data) {
    return ChallengeStateRow(
      challengeId: data.challengeId.present
          ? data.challengeId.value
          : this.challengeId,
      status: data.status.present ? data.status.value : this.status,
      solutionNotes: data.solutionNotes.present
          ? data.solutionNotes.value
          : this.solutionNotes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedOn: data.completedOn.present
          ? data.completedOn.value
          : this.completedOn,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChallengeStateRow(')
          ..write('challengeId: $challengeId, ')
          ..write('status: $status, ')
          ..write('solutionNotes: $solutionNotes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedOn: $completedOn, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    challengeId,
    status,
    solutionNotes,
    startedAt,
    completedOn,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChallengeStateRow &&
          other.challengeId == this.challengeId &&
          other.status == this.status &&
          other.solutionNotes == this.solutionNotes &&
          other.startedAt == this.startedAt &&
          other.completedOn == this.completedOn &&
          other.updatedAt == this.updatedAt);
}

class ChallengeStatesCompanion extends UpdateCompanion<ChallengeStateRow> {
  final Value<String> challengeId;
  final Value<ChallengeStatus> status;
  final Value<String> solutionNotes;
  final Value<DateTime?> startedAt;
  final Value<CalendarDate?> completedOn;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ChallengeStatesCompanion({
    this.challengeId = const Value.absent(),
    this.status = const Value.absent(),
    this.solutionNotes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedOn = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChallengeStatesCompanion.insert({
    required String challengeId,
    required ChallengeStatus status,
    this.solutionNotes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedOn = const Value.absent(),
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : challengeId = Value(challengeId),
       status = Value(status),
       updatedAt = Value(updatedAt);
  static Insertable<ChallengeStateRow> custom({
    Expression<String>? challengeId,
    Expression<String>? status,
    Expression<String>? solutionNotes,
    Expression<DateTime>? startedAt,
    Expression<int>? completedOn,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (challengeId != null) 'challenge_id': challengeId,
      if (status != null) 'status': status,
      if (solutionNotes != null) 'solution_notes': solutionNotes,
      if (startedAt != null) 'started_at': startedAt,
      if (completedOn != null) 'completed_on': completedOn,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChallengeStatesCompanion copyWith({
    Value<String>? challengeId,
    Value<ChallengeStatus>? status,
    Value<String>? solutionNotes,
    Value<DateTime?>? startedAt,
    Value<CalendarDate?>? completedOn,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ChallengeStatesCompanion(
      challengeId: challengeId ?? this.challengeId,
      status: status ?? this.status,
      solutionNotes: solutionNotes ?? this.solutionNotes,
      startedAt: startedAt ?? this.startedAt,
      completedOn: completedOn ?? this.completedOn,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (challengeId.present) {
      map['challenge_id'] = Variable<String>(challengeId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ChallengeStatesTable.$converterstatus.toSql(status.value),
      );
    }
    if (solutionNotes.present) {
      map['solution_notes'] = Variable<String>(solutionNotes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedOn.present) {
      map['completed_on'] = Variable<int>(
        $ChallengeStatesTable.$convertercompletedOnn.toSql(completedOn.value),
      );
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChallengeStatesCompanion(')
          ..write('challengeId: $challengeId, ')
          ..write('status: $status, ')
          ..write('solutionNotes: $solutionNotes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedOn: $completedOn, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final SearchIndex searchIndex = SearchIndex(this);
  late final $RoadmapsTable roadmaps = $RoadmapsTable(this);
  late final Trigger searchRoadmapsInsert = Trigger(
    'CREATE TRIGGER search_roadmaps_insert AFTER INSERT ON roadmaps BEGIN INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'roadmap\', new.id, new.title, new.description);END',
    'search_roadmaps_insert',
  );
  late final Trigger searchRoadmapsUpdate = Trigger(
    'CREATE TRIGGER search_roadmaps_update AFTER UPDATE ON roadmaps BEGIN DELETE FROM search_index WHERE kind = \'roadmap\' AND ref_id = old.id;INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'roadmap\', new.id, new.title, new.description);END',
    'search_roadmaps_update',
  );
  late final Trigger searchRoadmapsDelete = Trigger(
    'CREATE TRIGGER search_roadmaps_delete AFTER DELETE ON roadmaps BEGIN DELETE FROM search_index WHERE kind = \'roadmap\' AND ref_id = old.id;END',
    'search_roadmaps_delete',
  );
  late final $RoadmapSectionsTable roadmapSections = $RoadmapSectionsTable(
    this,
  );
  late final $TopicsTable topics = $TopicsTable(this);
  late final Trigger searchTopicsInsert = Trigger(
    'CREATE TRIGGER search_topics_insert AFTER INSERT ON topics BEGIN INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'topic\', new.id, new.title, new.description || \' \' || (SELECT group_concat(value, \'. \') FROM json_each(new.objectives)));END',
    'search_topics_insert',
  );
  late final Trigger searchTopicsUpdate = Trigger(
    'CREATE TRIGGER search_topics_update AFTER UPDATE ON topics BEGIN DELETE FROM search_index WHERE kind = \'topic\' AND ref_id = old.id;INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'topic\', new.id, new.title, new.description || \' \' || (SELECT group_concat(value, \'. \') FROM json_each(new.objectives)));END',
    'search_topics_update',
  );
  late final Trigger searchTopicsDelete = Trigger(
    'CREATE TRIGGER search_topics_delete AFTER DELETE ON topics BEGIN DELETE FROM search_index WHERE kind = \'topic\' AND ref_id = old.id;END',
    'search_topics_delete',
  );
  late final $NotesTable notes = $NotesTable(this);
  late final Trigger searchNotesInsert = Trigger(
    'CREATE TRIGGER search_notes_insert AFTER INSERT ON notes BEGIN INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'note\', new.id, new.title, new.content);END',
    'search_notes_insert',
  );
  late final Trigger searchNotesUpdate = Trigger(
    'CREATE TRIGGER search_notes_update AFTER UPDATE ON notes BEGIN DELETE FROM search_index WHERE kind = \'note\' AND ref_id = old.id;INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'note\', new.id, new.title, new.content);END',
    'search_notes_update',
  );
  late final Trigger searchNotesDelete = Trigger(
    'CREATE TRIGGER search_notes_delete AFTER DELETE ON notes BEGIN DELETE FROM search_index WHERE kind = \'note\' AND ref_id = old.id;END',
    'search_notes_delete',
  );
  late final $ResourcesTable resources = $ResourcesTable(this);
  late final Trigger searchResourcesInsert = Trigger(
    'CREATE TRIGGER search_resources_insert AFTER INSERT ON resources BEGIN INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'resource\', new.id, new.title, new.source);END',
    'search_resources_insert',
  );
  late final Trigger searchResourcesUpdate = Trigger(
    'CREATE TRIGGER search_resources_update AFTER UPDATE ON resources BEGIN DELETE FROM search_index WHERE kind = \'resource\' AND ref_id = old.id;INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'resource\', new.id, new.title, new.source);END',
    'search_resources_update',
  );
  late final Trigger searchResourcesDelete = Trigger(
    'CREATE TRIGGER search_resources_delete AFTER DELETE ON resources BEGIN DELETE FROM search_index WHERE kind = \'resource\' AND ref_id = old.id;END',
    'search_resources_delete',
  );
  late final $ChallengesTable challenges = $ChallengesTable(this);
  late final Trigger searchChallengesInsert = Trigger(
    'CREATE TRIGGER search_challenges_insert AFTER INSERT ON challenges BEGIN INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'challenge\', new.id, new.title, new.prompt);END',
    'search_challenges_insert',
  );
  late final Trigger searchChallengesUpdate = Trigger(
    'CREATE TRIGGER search_challenges_update AFTER UPDATE ON challenges BEGIN DELETE FROM search_index WHERE kind = \'challenge\' AND ref_id = old.id;INSERT INTO search_index (kind, ref_id, title, body) VALUES (\'challenge\', new.id, new.title, new.prompt);END',
    'search_challenges_update',
  );
  late final Trigger searchChallengesDelete = Trigger(
    'CREATE TRIGGER search_challenges_delete AFTER DELETE ON challenges BEGIN DELETE FROM search_index WHERE kind = \'challenge\' AND ref_id = old.id;END',
    'search_challenges_delete',
  );
  late final $TopicProgressTable topicProgress = $TopicProgressTable(this);
  late final $TopicBookmarksTable topicBookmarks = $TopicBookmarksTable(this);
  late final $ResourceBookmarksTable resourceBookmarks =
      $ResourceBookmarksTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $GoalCheckInsTable goalCheckIns = $GoalCheckInsTable(this);
  late final $ChallengeStatesTable challengeStates = $ChallengeStatesTable(
    this,
  );
  late final Index topicProgressByDay = Index(
    'topic_progress_by_day',
    'CREATE INDEX topic_progress_by_day ON topic_progress (completed_on)',
  );
  late final Index notesByUpdate = Index(
    'notes_by_update',
    'CREATE INDEX notes_by_update ON notes (updated_at)',
  );
  late final Index checkInsByGoalDay = Index(
    'check_ins_by_goal_day',
    'CREATE INDEX check_ins_by_goal_day ON goal_check_ins (goal_id, day)',
  );
  late final Index challengeStatesByDay = Index(
    'challenge_states_by_day',
    'CREATE INDEX challenge_states_by_day ON challenge_states (completed_on)',
  );
  late final Index sectionsByRoadmap = Index(
    'sections_by_roadmap',
    'CREATE INDEX sections_by_roadmap ON roadmap_sections (roadmap_id, sort_order)',
  );
  late final Index topicsBySection = Index(
    'topics_by_section',
    'CREATE INDEX topics_by_section ON topics (section_id, sort_order)',
  );
  late final Index topicsByRoadmap = Index(
    'topics_by_roadmap',
    'CREATE INDEX topics_by_roadmap ON topics (roadmap_id)',
  );
  late final CatalogDao catalogDao = CatalogDao(this as AppDatabase);
  late final LearningDao learningDao = LearningDao(this as AppDatabase);
  late final NotesDao notesDao = NotesDao(this as AppDatabase);
  late final GoalsDao goalsDao = GoalsDao(this as AppDatabase);
  late final ChallengesDao challengesDao = ChallengesDao(this as AppDatabase);
  late final ResourcesDao resourcesDao = ResourcesDao(this as AppDatabase);
  late final SearchDao searchDao = SearchDao(this as AppDatabase);
  late final UserDataDao userDataDao = UserDataDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    searchIndex,
    roadmaps,
    searchRoadmapsInsert,
    searchRoadmapsUpdate,
    searchRoadmapsDelete,
    roadmapSections,
    topics,
    searchTopicsInsert,
    searchTopicsUpdate,
    searchTopicsDelete,
    notes,
    searchNotesInsert,
    searchNotesUpdate,
    searchNotesDelete,
    resources,
    searchResourcesInsert,
    searchResourcesUpdate,
    searchResourcesDelete,
    challenges,
    searchChallengesInsert,
    searchChallengesUpdate,
    searchChallengesDelete,
    topicProgress,
    topicBookmarks,
    resourceBookmarks,
    goals,
    goalCheckIns,
    challengeStates,
    topicProgressByDay,
    notesByUpdate,
    checkInsByGoalDay,
    challengeStatesByDay,
    sectionsByRoadmap,
    topicsBySection,
    topicsByRoadmap,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmaps',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmaps',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('search_index', kind: UpdateKind.delete),
        TableUpdate('search_index', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmaps',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmaps',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('roadmap_sections', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmaps',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('topics', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'roadmap_sections',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('topics', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('search_index', kind: UpdateKind.delete),
        TableUpdate('search_index', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('notes', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'notes',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'notes',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('search_index', kind: UpdateKind.delete),
        TableUpdate('search_index', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'notes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resources', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resources',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resources',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('search_index', kind: UpdateKind.delete),
        TableUpdate('search_index', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resources',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'challenges',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'challenges',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('search_index', kind: UpdateKind.delete),
        TableUpdate('search_index', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'challenges',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_index', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('topic_progress', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'topics',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('topic_bookmarks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resources',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resource_bookmarks', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'goals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('goal_check_ins', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'challenges',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('challenge_states', kind: UpdateKind.delete)],
    ),
  ]);
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $SearchIndexCreateCompanionBuilder = SearchIndexCompanion Function({
  required String kind,
  required String refId,
  required String title,
  required String body,
  Value<int> rowid,
});
typedef $SearchIndexUpdateCompanionBuilder = SearchIndexCompanion Function({
  Value<String> kind,
  Value<String> refId,
  Value<String> title,
  Value<String> body,
  Value<int> rowid,
});

class $SearchIndexFilterComposer extends Composer<_$AppDatabase, SearchIndex> {
  $SearchIndexFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );
}

class $SearchIndexOrderingComposer
    extends Composer<_$AppDatabase, SearchIndex> {
  $SearchIndexOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );
}

class $SearchIndexAnnotationComposer
    extends Composer<_$AppDatabase, SearchIndex> {
  $SearchIndexAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $SearchIndexTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          SearchIndex,
          SearchIndexData,
          $SearchIndexFilterComposer,
          $SearchIndexOrderingComposer,
          $SearchIndexAnnotationComposer,
          $SearchIndexCreateCompanionBuilder,
          $SearchIndexUpdateCompanionBuilder,
          (
            SearchIndexData,
            BaseReferences<_$AppDatabase, SearchIndex, SearchIndexData>,
          ),
          SearchIndexData,
          PrefetchHooks Function()
        > {
  $SearchIndexTableManager(_$AppDatabase db, SearchIndex table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SearchIndexFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SearchIndexOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SearchIndexAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> kind = const Value.absent(),
                Value<String> refId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchIndexCompanion(
                kind: kind,
                refId: refId,
                title: title,
                body: body,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String kind,
                required String refId,
                required String title,
                required String body,
                Value<int> rowid = const Value.absent(),
              }) => SearchIndexCompanion.insert(
                kind: kind,
                refId: refId,
                title: title,
                body: body,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<SearchIndex, SearchIndexData>(table),
                  BaseReferences<_$AppDatabase, SearchIndex, SearchIndexData>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $SearchIndexProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      SearchIndex,
      SearchIndexData,
      $SearchIndexFilterComposer,
      $SearchIndexOrderingComposer,
      $SearchIndexAnnotationComposer,
      $SearchIndexCreateCompanionBuilder,
      $SearchIndexUpdateCompanionBuilder,
      (
        SearchIndexData,
        BaseReferences<_$AppDatabase, SearchIndex, SearchIndexData>,
      ),
      SearchIndexData,
      PrefetchHooks Function()
    >;
typedef $$RoadmapsTableCreateCompanionBuilder = RoadmapsCompanion Function({
  required String id,
  required String title,
  required String description,
  required RoadmapCategory category,
  required int sortOrder,
  Value<int> rowid,
});
typedef $$RoadmapsTableUpdateCompanionBuilder = RoadmapsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> description,
  Value<RoadmapCategory> category,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$RoadmapsTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapsTable, RoadmapRow> {
  $$RoadmapsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoadmapSectionsTable, List<SectionRow>>
  _roadmapSectionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.roadmapSections,
    aliasName: 'roadmaps__id__roadmap_sections__roadmap_id',
  );

  $$RoadmapSectionsTableProcessedTableManager get roadmapSectionsRefs {
    final manager = $$RoadmapSectionsTableTableManager(
      $_db,
      $_db.roadmapSections,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _roadmapSectionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TopicsTable, List<TopicRow>> _topicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.topics,
    aliasName: 'roadmaps__id__topics__roadmap_id',
  );

  $$TopicsTableProcessedTableManager get topicsRefs {
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoadmapsTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RoadmapCategory, RoadmapCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roadmapSectionsRefs(
    Expression<bool> Function($$RoadmapSectionsTableFilterComposer f) f,
  ) {
    final $$RoadmapSectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapSections,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapSectionsTableFilterComposer(
            $db: $db,
            $table: $db.roadmapSections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> topicsRefs(
    Expression<bool> Function($$TopicsTableFilterComposer f) f,
  ) {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoadmapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RoadmapCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> roadmapSectionsRefs<T extends Object>(
    Expression<T> Function($$RoadmapSectionsTableAnnotationComposer a) f,
  ) {
    final $$RoadmapSectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roadmapSections,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapSectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapSections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> topicsRefs<T extends Object>(
    Expression<T> Function($$TopicsTableAnnotationComposer a) f,
  ) {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapsTable,
          RoadmapRow,
          $$RoadmapsTableFilterComposer,
          $$RoadmapsTableOrderingComposer,
          $$RoadmapsTableAnnotationComposer,
          $$RoadmapsTableCreateCompanionBuilder,
          $$RoadmapsTableUpdateCompanionBuilder,
          (RoadmapRow, $$RoadmapsTableReferences),
          RoadmapRow,
          PrefetchHooks Function({bool roadmapSectionsRefs, bool topicsRefs})
        > {
  $$RoadmapsTableTableManager(_$AppDatabase db, $RoadmapsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<RoadmapCategory> category = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String description,
                required RoadmapCategory category,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoadmapsTable, RoadmapRow>(table),
                  $$RoadmapsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({roadmapSectionsRefs = false, topicsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (roadmapSectionsRefs) db.roadmapSections,
                    if (topicsRefs) db.topics,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (roadmapSectionsRefs)
                        await $_getPrefetchedData<
                          RoadmapRow,
                          $RoadmapsTable,
                          SectionRow
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._roadmapSectionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).roadmapSectionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (topicsRefs)
                        await $_getPrefetchedData<
                          RoadmapRow,
                          $RoadmapsTable,
                          TopicRow
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._topicsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).topicsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoadmapsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapsTable,
      RoadmapRow,
      $$RoadmapsTableFilterComposer,
      $$RoadmapsTableOrderingComposer,
      $$RoadmapsTableAnnotationComposer,
      $$RoadmapsTableCreateCompanionBuilder,
      $$RoadmapsTableUpdateCompanionBuilder,
      (RoadmapRow, $$RoadmapsTableReferences),
      RoadmapRow,
      PrefetchHooks Function({bool roadmapSectionsRefs, bool topicsRefs})
    >;
typedef $$RoadmapSectionsTableCreateCompanionBuilder =
    RoadmapSectionsCompanion Function({
      required String id,
      required String roadmapId,
      required String title,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$RoadmapSectionsTableUpdateCompanionBuilder =
    RoadmapSectionsCompanion Function({
      Value<String> id,
      Value<String> roadmapId,
      Value<String> title,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$RoadmapSectionsTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapSectionsTable, SectionRow> {
  $$RoadmapSectionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) =>
      db.roadmaps.createAlias('roadmap_sections__roadmap_id__roadmaps__id');

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TopicsTable, List<TopicRow>> _topicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.topics,
    aliasName: 'roadmap_sections__id__topics__section_id',
  );

  $$TopicsTableProcessedTableManager get topicsRefs {
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.sectionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoadmapSectionsTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapSectionsTable> {
  $$RoadmapSectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> topicsRefs(
    Expression<bool> Function($$TopicsTableFilterComposer f) f,
  ) {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapSectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapSectionsTable> {
  $$RoadmapSectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoadmapSectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapSectionsTable> {
  $$RoadmapSectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> topicsRefs<T extends Object>(
    Expression<T> Function($$TopicsTableAnnotationComposer a) f,
  ) {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.sectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapSectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapSectionsTable,
          SectionRow,
          $$RoadmapSectionsTableFilterComposer,
          $$RoadmapSectionsTableOrderingComposer,
          $$RoadmapSectionsTableAnnotationComposer,
          $$RoadmapSectionsTableCreateCompanionBuilder,
          $$RoadmapSectionsTableUpdateCompanionBuilder,
          (SectionRow, $$RoadmapSectionsTableReferences),
          SectionRow,
          PrefetchHooks Function({bool roadmapId, bool topicsRefs})
        > {
  $$RoadmapSectionsTableTableManager(
    _$AppDatabase db,
    $RoadmapSectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapSectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapSectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapSectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roadmapId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapSectionsCompanion(
                id: id,
                roadmapId: roadmapId,
                title: title,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roadmapId,
                required String title,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => RoadmapSectionsCompanion.insert(
                id: id,
                roadmapId: roadmapId,
                title: title,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RoadmapSectionsTable, SectionRow>(table),
                  $$RoadmapSectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roadmapId = false, topicsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (topicsRefs) db.topics],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roadmapId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.roadmapId,
                        referencedTable: $$RoadmapSectionsTableReferences
                            ._roadmapIdTable(db),
                        referencedColumn: $$RoadmapSectionsTableReferences
                            ._roadmapIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (topicsRefs)
                    await $_getPrefetchedData<
                      SectionRow,
                      $RoadmapSectionsTable,
                      TopicRow
                    >(
                      currentTable: table,
                      referencedTable: $$RoadmapSectionsTableReferences
                          ._topicsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RoadmapSectionsTableReferences(
                            db,
                            table,
                            p0,
                          ).topicsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sectionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoadmapSectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapSectionsTable,
      SectionRow,
      $$RoadmapSectionsTableFilterComposer,
      $$RoadmapSectionsTableOrderingComposer,
      $$RoadmapSectionsTableAnnotationComposer,
      $$RoadmapSectionsTableCreateCompanionBuilder,
      $$RoadmapSectionsTableUpdateCompanionBuilder,
      (SectionRow, $$RoadmapSectionsTableReferences),
      SectionRow,
      PrefetchHooks Function({bool roadmapId, bool topicsRefs})
    >;
typedef $$TopicsTableCreateCompanionBuilder = TopicsCompanion Function({
  required String id,
  required String roadmapId,
  required String sectionId,
  required String title,
  required String description,
  required List<String> objectives,
  required Difficulty difficulty,
  required int estimatedMinutes,
  required int sortOrder,
  Value<int> rowid,
});
typedef $$TopicsTableUpdateCompanionBuilder = TopicsCompanion Function({
  Value<String> id,
  Value<String> roadmapId,
  Value<String> sectionId,
  Value<String> title,
  Value<String> description,
  Value<List<String>> objectives,
  Value<Difficulty> difficulty,
  Value<int> estimatedMinutes,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$TopicsTableReferences
    extends BaseReferences<_$AppDatabase, $TopicsTable, TopicRow> {
  $$TopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) =>
      db.roadmaps.createAlias('topics__roadmap_id__roadmaps__id');

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoadmapSectionsTable _sectionIdTable(_$AppDatabase db) => db
      .roadmapSections
      .createAlias('topics__section_id__roadmap_sections__id');

  $$RoadmapSectionsTableProcessedTableManager get sectionId {
    final $_column = $_itemColumn<String>('section_id')!;

    final manager = $$RoadmapSectionsTableTableManager(
      $_db,
      $_db.roadmapSections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NotesTable, List<NoteRow>> _notesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.notes,
    aliasName: 'topics__id__notes__topic_id',
  );

  $$NotesTableProcessedTableManager get notesRefs {
    final manager = $$NotesTableTableManager(
      $_db,
      $_db.notes,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResourcesTable, List<ResourceRow>>
  _resourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resources,
    aliasName: 'topics__id__resources__topic_id',
  );

  $$ResourcesTableProcessedTableManager get resourcesRefs {
    final manager = $$ResourcesTableTableManager(
      $_db,
      $_db.resources,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_resourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TopicProgressTable, List<TopicProgressRow>>
  _topicProgressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.topicProgress,
    aliasName: 'topics__id__topic_progress__topic_id',
  );

  $$TopicProgressTableProcessedTableManager get topicProgressRefs {
    final manager = $$TopicProgressTableTableManager(
      $_db,
      $_db.topicProgress,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicProgressRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TopicBookmarksTable, List<TopicBookmarkRow>>
  _topicBookmarksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.topicBookmarks,
    aliasName: 'topics__id__topic_bookmarks__topic_id',
  );

  $$TopicBookmarksTableProcessedTableManager get topicBookmarksRefs {
    final manager = $$TopicBookmarksTableTableManager(
      $_db,
      $_db.topicBookmarks,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_topicBookmarksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, String>
  get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoadmapSectionsTableFilterComposer get sectionId {
    final $$RoadmapSectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.roadmapSections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapSectionsTableFilterComposer(
            $db: $db,
            $table: $db.roadmapSections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> notesRefs(
    Expression<bool> Function($$NotesTableFilterComposer f) f,
  ) {
    final $$NotesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableFilterComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resourcesRefs(
    Expression<bool> Function($$ResourcesTableFilterComposer f) f,
  ) {
    final $$ResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableFilterComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> topicProgressRefs(
    Expression<bool> Function($$TopicProgressTableFilterComposer f) f,
  ) {
    final $$TopicProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topicProgress,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicProgressTableFilterComposer(
            $db: $db,
            $table: $db.topicProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> topicBookmarksRefs(
    Expression<bool> Function($$TopicBookmarksTableFilterComposer f) f,
  ) {
    final $$TopicBookmarksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topicBookmarks,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicBookmarksTableFilterComposer(
            $db: $db,
            $table: $db.topicBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objectives => $composableBuilder(
    column: $table.objectives,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoadmapSectionsTableOrderingComposer get sectionId {
    final $$RoadmapSectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.roadmapSections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapSectionsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmapSections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>, String> get objectives =>
      $composableBuilder(
        column: $table.objectives,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Difficulty, String> get difficulty =>
      $composableBuilder(
        column: $table.difficulty,
        builder: (column) => column,
      );

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoadmapSectionsTableAnnotationComposer get sectionId {
    final $$RoadmapSectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sectionId,
      referencedTable: $db.roadmapSections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapSectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmapSections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> notesRefs<T extends Object>(
    Expression<T> Function($$NotesTableAnnotationComposer a) f,
  ) {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notes,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotesTableAnnotationComposer(
            $db: $db,
            $table: $db.notes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resourcesRefs<T extends Object>(
    Expression<T> Function($$ResourcesTableAnnotationComposer a) f,
  ) {
    final $$ResourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> topicProgressRefs<T extends Object>(
    Expression<T> Function($$TopicProgressTableAnnotationComposer a) f,
  ) {
    final $$TopicProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topicProgress,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.topicProgress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> topicBookmarksRefs<T extends Object>(
    Expression<T> Function($$TopicBookmarksTableAnnotationComposer a) f,
  ) {
    final $$TopicBookmarksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.topicBookmarks,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicBookmarksTableAnnotationComposer(
            $db: $db,
            $table: $db.topicBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicsTable,
          TopicRow,
          $$TopicsTableFilterComposer,
          $$TopicsTableOrderingComposer,
          $$TopicsTableAnnotationComposer,
          $$TopicsTableCreateCompanionBuilder,
          $$TopicsTableUpdateCompanionBuilder,
          (TopicRow, $$TopicsTableReferences),
          TopicRow,
          PrefetchHooks Function({
            bool roadmapId,
            bool sectionId,
            bool notesRefs,
            bool resourcesRefs,
            bool topicProgressRefs,
            bool topicBookmarksRefs,
          })
        > {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roadmapId = const Value.absent(),
                Value<String> sectionId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<List<String>> objectives = const Value.absent(),
                Value<Difficulty> difficulty = const Value.absent(),
                Value<int> estimatedMinutes = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion(
                id: id,
                roadmapId: roadmapId,
                sectionId: sectionId,
                title: title,
                description: description,
                objectives: objectives,
                difficulty: difficulty,
                estimatedMinutes: estimatedMinutes,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roadmapId,
                required String sectionId,
                required String title,
                required String description,
                required List<String> objectives,
                required Difficulty difficulty,
                required int estimatedMinutes,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => TopicsCompanion.insert(
                id: id,
                roadmapId: roadmapId,
                sectionId: sectionId,
                title: title,
                description: description,
                objectives: objectives,
                difficulty: difficulty,
                estimatedMinutes: estimatedMinutes,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicsTable, TopicRow>(table),
                  $$TopicsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roadmapId = false,
                sectionId = false,
                notesRefs = false,
                resourcesRefs = false,
                topicProgressRefs = false,
                topicBookmarksRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (notesRefs) db.notes,
                    if (resourcesRefs) db.resources,
                    if (topicProgressRefs) db.topicProgress,
                    if (topicBookmarksRefs) db.topicBookmarks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roadmapId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.roadmapId,
                            referencedTable: $$TopicsTableReferences
                                ._roadmapIdTable(db),
                            referencedColumn: $$TopicsTableReferences
                                ._roadmapIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (sectionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sectionId,
                            referencedTable: $$TopicsTableReferences
                                ._sectionIdTable(db),
                            referencedColumn: $$TopicsTableReferences
                                ._sectionIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (notesRefs)
                        await $_getPrefetchedData<
                          TopicRow,
                          $TopicsTable,
                          NoteRow
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._notesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(db, table, p0).notesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.topicId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (resourcesRefs)
                        await $_getPrefetchedData<
                          TopicRow,
                          $TopicsTable,
                          ResourceRow
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._resourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).resourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.topicId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (topicProgressRefs)
                        await $_getPrefetchedData<
                          TopicRow,
                          $TopicsTable,
                          TopicProgressRow
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._topicProgressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).topicProgressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.topicId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (topicBookmarksRefs)
                        await $_getPrefetchedData<
                          TopicRow,
                          $TopicsTable,
                          TopicBookmarkRow
                        >(
                          currentTable: table,
                          referencedTable: $$TopicsTableReferences
                              ._topicBookmarksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TopicsTableReferences(
                                db,
                                table,
                                p0,
                              ).topicBookmarksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.topicId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicsTable,
      TopicRow,
      $$TopicsTableFilterComposer,
      $$TopicsTableOrderingComposer,
      $$TopicsTableAnnotationComposer,
      $$TopicsTableCreateCompanionBuilder,
      $$TopicsTableUpdateCompanionBuilder,
      (TopicRow, $$TopicsTableReferences),
      TopicRow,
      PrefetchHooks Function({
        bool roadmapId,
        bool sectionId,
        bool notesRefs,
        bool resourcesRefs,
        bool topicProgressRefs,
        bool topicBookmarksRefs,
      })
    >;
typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  required String id,
  Value<String?> topicId,
  required String title,
  required String content,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<String> id,
  Value<String?> topicId,
  Value<String> title,
  Value<String> content,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$NotesTableReferences
    extends BaseReferences<_$AppDatabase, $NotesTable, NoteRow> {
  $$NotesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('notes__topic_id__topics__id');

  $$TopicsTableProcessedTableManager? get topicId {
    final $_column = $_itemColumn<String>('topic_id');
    if ($_column == null) return null;
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          NoteRow,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (NoteRow, $$NotesTableReferences),
          NoteRow,
          PrefetchHooks Function({bool topicId})
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> topicId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                id: id,
                topicId: topicId,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> topicId = const Value.absent(),
                required String title,
                required String content,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                id: id,
                topicId: topicId,
                title: title,
                content: content,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NotesTable, NoteRow>(table),
                  $$NotesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({topicId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (topicId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.topicId,
                        referencedTable: $$NotesTableReferences._topicIdTable(
                          db,
                        ),
                        referencedColumn: $$NotesTableReferences
                            ._topicIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      NoteRow,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (NoteRow, $$NotesTableReferences),
      NoteRow,
      PrefetchHooks Function({bool topicId})
    >;
typedef $$ResourcesTableCreateCompanionBuilder = ResourcesCompanion Function({
  required String id,
  required String title,
  required ResourceType type,
  required Uri url,
  required String source,
  required int estimatedMinutes,
  Value<String?> topicId,
  required int sortOrder,
  Value<int> rowid,
});
typedef $$ResourcesTableUpdateCompanionBuilder = ResourcesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<ResourceType> type,
  Value<Uri> url,
  Value<String> source,
  Value<int> estimatedMinutes,
  Value<String?> topicId,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$ResourcesTableReferences
    extends BaseReferences<_$AppDatabase, $ResourcesTable, ResourceRow> {
  $$ResourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('resources__topic_id__topics__id');

  $$TopicsTableProcessedTableManager? get topicId {
    final $_column = $_itemColumn<String>('topic_id');
    if ($_column == null) return null;
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ResourceBookmarksTable, List<ResourceBookmarkRow>>
  _resourceBookmarksRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.resourceBookmarks,
        aliasName: 'resources__id__resource_bookmarks__resource_id',
      );

  $$ResourceBookmarksTableProcessedTableManager get resourceBookmarksRefs {
    final manager = $$ResourceBookmarksTableTableManager(
      $_db,
      $_db.resourceBookmarks,
    ).filter((f) => f.resourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _resourceBookmarksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ResourcesTableFilterComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ResourceType, ResourceType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Uri, Uri, String> get url =>
      $composableBuilder(
        column: $table.url,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> resourceBookmarksRefs(
    Expression<bool> Function($$ResourceBookmarksTableFilterComposer f) f,
  ) {
    final $$ResourceBookmarksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceBookmarks,
      getReferencedColumn: (t) => t.resourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceBookmarksTableFilterComposer(
            $db: $db,
            $table: $db.resourceBookmarks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ResourceType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Uri, String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> resourceBookmarksRefs<T extends Object>(
    Expression<T> Function($$ResourceBookmarksTableAnnotationComposer a) f,
  ) {
    final $$ResourceBookmarksTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.resourceBookmarks,
          getReferencedColumn: (t) => t.resourceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ResourceBookmarksTableAnnotationComposer(
                $db: $db,
                $table: $db.resourceBookmarks,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ResourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResourcesTable,
          ResourceRow,
          $$ResourcesTableFilterComposer,
          $$ResourcesTableOrderingComposer,
          $$ResourcesTableAnnotationComposer,
          $$ResourcesTableCreateCompanionBuilder,
          $$ResourcesTableUpdateCompanionBuilder,
          (ResourceRow, $$ResourcesTableReferences),
          ResourceRow,
          PrefetchHooks Function({bool topicId, bool resourceBookmarksRefs})
        > {
  $$ResourcesTableTableManager(_$AppDatabase db, $ResourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<ResourceType> type = const Value.absent(),
                Value<Uri> url = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<int> estimatedMinutes = const Value.absent(),
                Value<String?> topicId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourcesCompanion(
                id: id,
                title: title,
                type: type,
                url: url,
                source: source,
                estimatedMinutes: estimatedMinutes,
                topicId: topicId,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required ResourceType type,
                required Uri url,
                required String source,
                required int estimatedMinutes,
                Value<String?> topicId = const Value.absent(),
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => ResourcesCompanion.insert(
                id: id,
                title: title,
                type: type,
                url: url,
                source: source,
                estimatedMinutes: estimatedMinutes,
                topicId: topicId,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResourcesTable, ResourceRow>(table),
                  $$ResourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({topicId = false, resourceBookmarksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (resourceBookmarksRefs) db.resourceBookmarks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (topicId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.topicId,
                            referencedTable: $$ResourcesTableReferences
                                ._topicIdTable(db),
                            referencedColumn: $$ResourcesTableReferences
                                ._topicIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (resourceBookmarksRefs)
                        await $_getPrefetchedData<
                          ResourceRow,
                          $ResourcesTable,
                          ResourceBookmarkRow
                        >(
                          currentTable: table,
                          referencedTable: $$ResourcesTableReferences
                              ._resourceBookmarksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ResourcesTableReferences(
                                db,
                                table,
                                p0,
                              ).resourceBookmarksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.resourceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ResourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResourcesTable,
      ResourceRow,
      $$ResourcesTableFilterComposer,
      $$ResourcesTableOrderingComposer,
      $$ResourcesTableAnnotationComposer,
      $$ResourcesTableCreateCompanionBuilder,
      $$ResourcesTableUpdateCompanionBuilder,
      (ResourceRow, $$ResourcesTableReferences),
      ResourceRow,
      PrefetchHooks Function({bool topicId, bool resourceBookmarksRefs})
    >;
typedef $$ChallengesTableCreateCompanionBuilder = ChallengesCompanion Function({
  required String id,
  required String title,
  required ChallengeCategory category,
  required Difficulty difficulty,
  required String prompt,
  required List<String> hints,
  required int sortOrder,
  Value<int> rowid,
});
typedef $$ChallengesTableUpdateCompanionBuilder = ChallengesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<ChallengeCategory> category,
  Value<Difficulty> difficulty,
  Value<String> prompt,
  Value<List<String>> hints,
  Value<int> sortOrder,
  Value<int> rowid,
});

final class $$ChallengesTableReferences
    extends BaseReferences<_$AppDatabase, $ChallengesTable, ChallengeRow> {
  $$ChallengesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChallengeStatesTable, List<ChallengeStateRow>>
  _challengeStatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.challengeStates,
    aliasName: 'challenges__id__challenge_states__challenge_id',
  );

  $$ChallengeStatesTableProcessedTableManager get challengeStatesRefs {
    final manager = $$ChallengeStatesTableTableManager(
      $_db,
      $_db.challengeStates,
    ).filter((f) => f.challengeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _challengeStatesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChallengesTableFilterComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ChallengeCategory, ChallengeCategory, String>
  get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, String>
  get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get hints => $composableBuilder(
    column: $table.hints,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> challengeStatesRefs(
    Expression<bool> Function($$ChallengeStatesTableFilterComposer f) f,
  ) {
    final $$ChallengeStatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.challengeStates,
      getReferencedColumn: (t) => t.challengeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChallengeStatesTableFilterComposer(
            $db: $db,
            $table: $db.challengeStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChallengesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hints => $composableBuilder(
    column: $table.hints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChallengesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChallengesTable> {
  $$ChallengesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ChallengeCategory, String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Difficulty, String> get difficulty =>
      $composableBuilder(
        column: $table.difficulty,
        builder: (column) => column,
      );

  GeneratedColumn<String> get prompt =>
      $composableBuilder(column: $table.prompt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get hints =>
      $composableBuilder(column: $table.hints, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  Expression<T> challengeStatesRefs<T extends Object>(
    Expression<T> Function($$ChallengeStatesTableAnnotationComposer a) f,
  ) {
    final $$ChallengeStatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.challengeStates,
      getReferencedColumn: (t) => t.challengeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChallengeStatesTableAnnotationComposer(
            $db: $db,
            $table: $db.challengeStates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChallengesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChallengesTable,
          ChallengeRow,
          $$ChallengesTableFilterComposer,
          $$ChallengesTableOrderingComposer,
          $$ChallengesTableAnnotationComposer,
          $$ChallengesTableCreateCompanionBuilder,
          $$ChallengesTableUpdateCompanionBuilder,
          (ChallengeRow, $$ChallengesTableReferences),
          ChallengeRow,
          PrefetchHooks Function({bool challengeStatesRefs})
        > {
  $$ChallengesTableTableManager(_$AppDatabase db, $ChallengesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChallengesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChallengesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChallengesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<ChallengeCategory> category = const Value.absent(),
                Value<Difficulty> difficulty = const Value.absent(),
                Value<String> prompt = const Value.absent(),
                Value<List<String>> hints = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChallengesCompanion(
                id: id,
                title: title,
                category: category,
                difficulty: difficulty,
                prompt: prompt,
                hints: hints,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required ChallengeCategory category,
                required Difficulty difficulty,
                required String prompt,
                required List<String> hints,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => ChallengesCompanion.insert(
                id: id,
                title: title,
                category: category,
                difficulty: difficulty,
                prompt: prompt,
                hints: hints,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChallengesTable, ChallengeRow>(table),
                  $$ChallengesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({challengeStatesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (challengeStatesRefs) db.challengeStates,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (challengeStatesRefs)
                    await $_getPrefetchedData<
                      ChallengeRow,
                      $ChallengesTable,
                      ChallengeStateRow
                    >(
                      currentTable: table,
                      referencedTable: $$ChallengesTableReferences
                          ._challengeStatesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ChallengesTableReferences(
                            db,
                            table,
                            p0,
                          ).challengeStatesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.challengeId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChallengesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChallengesTable,
      ChallengeRow,
      $$ChallengesTableFilterComposer,
      $$ChallengesTableOrderingComposer,
      $$ChallengesTableAnnotationComposer,
      $$ChallengesTableCreateCompanionBuilder,
      $$ChallengesTableUpdateCompanionBuilder,
      (ChallengeRow, $$ChallengesTableReferences),
      ChallengeRow,
      PrefetchHooks Function({bool challengeStatesRefs})
    >;
typedef $$TopicProgressTableCreateCompanionBuilder =
    TopicProgressCompanion Function({
      required String topicId,
      required CalendarDate completedOn,
      required DateTime completedAt,
      Value<int> rowid,
    });
typedef $$TopicProgressTableUpdateCompanionBuilder =
    TopicProgressCompanion Function({
      Value<String> topicId,
      Value<CalendarDate> completedOn,
      Value<DateTime> completedAt,
      Value<int> rowid,
    });

final class $$TopicProgressTableReferences
    extends
        BaseReferences<_$AppDatabase, $TopicProgressTable, TopicProgressRow> {
  $$TopicProgressTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('topic_progress__topic_id__topics__id');

  $$TopicsTableProcessedTableManager get topicId {
    final $_column = $_itemColumn<String>('topic_id')!;

    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TopicProgressTableFilterComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<CalendarDate, CalendarDate, int>
  get completedOn => $composableBuilder(
    column: $table.completedOn,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get completedOn => $composableBuilder(
    column: $table.completedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicProgressTable> {
  $$TopicProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<CalendarDate, int> get completedOn =>
      $composableBuilder(
        column: $table.completedOn,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicProgressTable,
          TopicProgressRow,
          $$TopicProgressTableFilterComposer,
          $$TopicProgressTableOrderingComposer,
          $$TopicProgressTableAnnotationComposer,
          $$TopicProgressTableCreateCompanionBuilder,
          $$TopicProgressTableUpdateCompanionBuilder,
          (TopicProgressRow, $$TopicProgressTableReferences),
          TopicProgressRow,
          PrefetchHooks Function({bool topicId})
        > {
  $$TopicProgressTableTableManager(_$AppDatabase db, $TopicProgressTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> topicId = const Value.absent(),
                Value<CalendarDate> completedOn = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicProgressCompanion(
                topicId: topicId,
                completedOn: completedOn,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String topicId,
                required CalendarDate completedOn,
                required DateTime completedAt,
                Value<int> rowid = const Value.absent(),
              }) => TopicProgressCompanion.insert(
                topicId: topicId,
                completedOn: completedOn,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicProgressTable, TopicProgressRow>(table),
                  $$TopicProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({topicId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (topicId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.topicId,
                        referencedTable: $$TopicProgressTableReferences
                            ._topicIdTable(db),
                        referencedColumn: $$TopicProgressTableReferences
                            ._topicIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TopicProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicProgressTable,
      TopicProgressRow,
      $$TopicProgressTableFilterComposer,
      $$TopicProgressTableOrderingComposer,
      $$TopicProgressTableAnnotationComposer,
      $$TopicProgressTableCreateCompanionBuilder,
      $$TopicProgressTableUpdateCompanionBuilder,
      (TopicProgressRow, $$TopicProgressTableReferences),
      TopicProgressRow,
      PrefetchHooks Function({bool topicId})
    >;
typedef $$TopicBookmarksTableCreateCompanionBuilder =
    TopicBookmarksCompanion Function({
      required String topicId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$TopicBookmarksTableUpdateCompanionBuilder =
    TopicBookmarksCompanion Function({
      Value<String> topicId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$TopicBookmarksTableReferences
    extends
        BaseReferences<_$AppDatabase, $TopicBookmarksTable, TopicBookmarkRow> {
  $$TopicBookmarksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TopicsTable _topicIdTable(_$AppDatabase db) =>
      db.topics.createAlias('topic_bookmarks__topic_id__topics__id');

  $$TopicsTableProcessedTableManager get topicId {
    final $_column = $_itemColumn<String>('topic_id')!;

    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TopicBookmarksTableFilterComposer
    extends Composer<_$AppDatabase, $TopicBookmarksTable> {
  $$TopicBookmarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicBookmarksTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicBookmarksTable> {
  $$TopicBookmarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicBookmarksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicBookmarksTable> {
  $$TopicBookmarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TopicBookmarksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicBookmarksTable,
          TopicBookmarkRow,
          $$TopicBookmarksTableFilterComposer,
          $$TopicBookmarksTableOrderingComposer,
          $$TopicBookmarksTableAnnotationComposer,
          $$TopicBookmarksTableCreateCompanionBuilder,
          $$TopicBookmarksTableUpdateCompanionBuilder,
          (TopicBookmarkRow, $$TopicBookmarksTableReferences),
          TopicBookmarkRow,
          PrefetchHooks Function({bool topicId})
        > {
  $$TopicBookmarksTableTableManager(
    _$AppDatabase db,
    $TopicBookmarksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicBookmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicBookmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicBookmarksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> topicId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TopicBookmarksCompanion(
                topicId: topicId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String topicId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => TopicBookmarksCompanion.insert(
                topicId: topicId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TopicBookmarksTable, TopicBookmarkRow>(table),
                  $$TopicBookmarksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({topicId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (topicId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.topicId,
                        referencedTable: $$TopicBookmarksTableReferences
                            ._topicIdTable(db),
                        referencedColumn: $$TopicBookmarksTableReferences
                            ._topicIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TopicBookmarksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicBookmarksTable,
      TopicBookmarkRow,
      $$TopicBookmarksTableFilterComposer,
      $$TopicBookmarksTableOrderingComposer,
      $$TopicBookmarksTableAnnotationComposer,
      $$TopicBookmarksTableCreateCompanionBuilder,
      $$TopicBookmarksTableUpdateCompanionBuilder,
      (TopicBookmarkRow, $$TopicBookmarksTableReferences),
      TopicBookmarkRow,
      PrefetchHooks Function({bool topicId})
    >;
typedef $$ResourceBookmarksTableCreateCompanionBuilder =
    ResourceBookmarksCompanion Function({
      required String resourceId,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ResourceBookmarksTableUpdateCompanionBuilder =
    ResourceBookmarksCompanion Function({
      Value<String> resourceId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ResourceBookmarksTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ResourceBookmarksTable,
          ResourceBookmarkRow
        > {
  $$ResourceBookmarksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ResourcesTable _resourceIdTable(_$AppDatabase db) => db.resources
      .createAlias('resource_bookmarks__resource_id__resources__id');

  $$ResourcesTableProcessedTableManager get resourceId {
    final $_column = $_itemColumn<String>('resource_id')!;

    final manager = $$ResourcesTableTableManager(
      $_db,
      $_db.resources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_resourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResourceBookmarksTableFilterComposer
    extends Composer<_$AppDatabase, $ResourceBookmarksTable> {
  $$ResourceBookmarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ResourcesTableFilterComposer get resourceId {
    final $$ResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableFilterComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceBookmarksTableOrderingComposer
    extends Composer<_$AppDatabase, $ResourceBookmarksTable> {
  $$ResourceBookmarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ResourcesTableOrderingComposer get resourceId {
    final $$ResourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableOrderingComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceBookmarksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResourceBookmarksTable> {
  $$ResourceBookmarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ResourcesTableAnnotationComposer get resourceId {
    final $$ResourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceBookmarksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResourceBookmarksTable,
          ResourceBookmarkRow,
          $$ResourceBookmarksTableFilterComposer,
          $$ResourceBookmarksTableOrderingComposer,
          $$ResourceBookmarksTableAnnotationComposer,
          $$ResourceBookmarksTableCreateCompanionBuilder,
          $$ResourceBookmarksTableUpdateCompanionBuilder,
          (ResourceBookmarkRow, $$ResourceBookmarksTableReferences),
          ResourceBookmarkRow,
          PrefetchHooks Function({bool resourceId})
        > {
  $$ResourceBookmarksTableTableManager(
    _$AppDatabase db,
    $ResourceBookmarksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResourceBookmarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResourceBookmarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResourceBookmarksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> resourceId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourceBookmarksCompanion(
                resourceId: resourceId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String resourceId,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ResourceBookmarksCompanion.insert(
                resourceId: resourceId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResourceBookmarksTable, ResourceBookmarkRow>(
                    table,
                  ),
                  $$ResourceBookmarksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({resourceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (resourceId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.resourceId,
                        referencedTable: $$ResourceBookmarksTableReferences
                            ._resourceIdTable(db),
                        referencedColumn: $$ResourceBookmarksTableReferences
                            ._resourceIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ResourceBookmarksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResourceBookmarksTable,
      ResourceBookmarkRow,
      $$ResourceBookmarksTableFilterComposer,
      $$ResourceBookmarksTableOrderingComposer,
      $$ResourceBookmarksTableAnnotationComposer,
      $$ResourceBookmarksTableCreateCompanionBuilder,
      $$ResourceBookmarksTableUpdateCompanionBuilder,
      (ResourceBookmarkRow, $$ResourceBookmarksTableReferences),
      ResourceBookmarkRow,
      PrefetchHooks Function({bool resourceId})
    >;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String title,
  required GoalKind kind,
  required GoalPeriod period,
  required int target,
  required CalendarDate createdOn,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<GoalKind> kind,
  Value<GoalPeriod> period,
  Value<int> target,
  Value<CalendarDate> createdOn,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, GoalRow> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GoalCheckInsTable, List<GoalCheckInRow>>
  _goalCheckInsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.goalCheckIns,
    aliasName: 'goals__id__goal_check_ins__goal_id',
  );

  $$GoalCheckInsTableProcessedTableManager get goalCheckInsRefs {
    final manager = $$GoalCheckInsTableTableManager(
      $_db,
      $_db.goalCheckIns,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalCheckInsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GoalKind, GoalKind, String> get kind =>
      $composableBuilder(
        column: $table.kind,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<GoalPeriod, GoalPeriod, String> get period =>
      $composableBuilder(
        column: $table.period,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CalendarDate, CalendarDate, int>
  get createdOn => $composableBuilder(
    column: $table.createdOn,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> goalCheckInsRefs(
    Expression<bool> Function($$GoalCheckInsTableFilterComposer f) f,
  ) {
    final $$GoalCheckInsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalCheckIns,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalCheckInsTableFilterComposer(
            $db: $db,
            $table: $db.goalCheckIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdOn => $composableBuilder(
    column: $table.createdOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GoalKind, String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GoalPeriod, String> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<int> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CalendarDate, int> get createdOn =>
      $composableBuilder(column: $table.createdOn, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> goalCheckInsRefs<T extends Object>(
    Expression<T> Function($$GoalCheckInsTableAnnotationComposer a) f,
  ) {
    final $$GoalCheckInsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalCheckIns,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalCheckInsTableAnnotationComposer(
            $db: $db,
            $table: $db.goalCheckIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          GoalRow,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (GoalRow, $$GoalsTableReferences),
          GoalRow,
          PrefetchHooks Function({bool goalCheckInsRefs})
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<GoalKind> kind = const Value.absent(),
                Value<GoalPeriod> period = const Value.absent(),
                Value<int> target = const Value.absent(),
                Value<CalendarDate> createdOn = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                title: title,
                kind: kind,
                period: period,
                target: target,
                createdOn: createdOn,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required GoalKind kind,
                required GoalPeriod period,
                required int target,
                required CalendarDate createdOn,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                title: title,
                kind: kind,
                period: period,
                target: target,
                createdOn: createdOn,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalsTable, GoalRow>(table),
                  $$GoalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalCheckInsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalCheckInsRefs) db.goalCheckIns],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalCheckInsRefs)
                    await $_getPrefetchedData<
                      GoalRow,
                      $GoalsTable,
                      GoalCheckInRow
                    >(
                      currentTable: table,
                      referencedTable: $$GoalsTableReferences
                          ._goalCheckInsRefsTable(db),
                      managerFromTypedResult: (p0) => $$GoalsTableReferences(
                        db,
                        table,
                        p0,
                      ).goalCheckInsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.goalId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      GoalRow,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (GoalRow, $$GoalsTableReferences),
      GoalRow,
      PrefetchHooks Function({bool goalCheckInsRefs})
    >;
typedef $$GoalCheckInsTableCreateCompanionBuilder =
    GoalCheckInsCompanion Function({
      Value<int> id,
      required String goalId,
      required CalendarDate day,
      required DateTime createdAt,
    });
typedef $$GoalCheckInsTableUpdateCompanionBuilder =
    GoalCheckInsCompanion Function({
      Value<int> id,
      Value<String> goalId,
      Value<CalendarDate> day,
      Value<DateTime> createdAt,
    });

final class $$GoalCheckInsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalCheckInsTable, GoalCheckInRow> {
  $$GoalCheckInsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIdTable(_$AppDatabase db) =>
      db.goals.createAlias('goal_check_ins__goal_id__goals__id');

  $$GoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<String>('goal_id')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalCheckInsTableFilterComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CalendarDate, CalendarDate, int> get day =>
      $composableBuilder(
        column: $table.day,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckInsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckInsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalCheckInsTable> {
  $$GoalCheckInsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CalendarDate, int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalCheckInsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalCheckInsTable,
          GoalCheckInRow,
          $$GoalCheckInsTableFilterComposer,
          $$GoalCheckInsTableOrderingComposer,
          $$GoalCheckInsTableAnnotationComposer,
          $$GoalCheckInsTableCreateCompanionBuilder,
          $$GoalCheckInsTableUpdateCompanionBuilder,
          (GoalCheckInRow, $$GoalCheckInsTableReferences),
          GoalCheckInRow,
          PrefetchHooks Function({bool goalId})
        > {
  $$GoalCheckInsTableTableManager(_$AppDatabase db, $GoalCheckInsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalCheckInsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalCheckInsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalCheckInsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> goalId = const Value.absent(),
                Value<CalendarDate> day = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GoalCheckInsCompanion(
                id: id,
                goalId: goalId,
                day: day,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String goalId,
                required CalendarDate day,
                required DateTime createdAt,
              }) => GoalCheckInsCompanion.insert(
                id: id,
                goalId: goalId,
                day: day,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$GoalCheckInsTable, GoalCheckInRow>(table),
                  $$GoalCheckInsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.goalId,
                        referencedTable: $$GoalCheckInsTableReferences
                            ._goalIdTable(db),
                        referencedColumn: $$GoalCheckInsTableReferences
                            ._goalIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalCheckInsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalCheckInsTable,
      GoalCheckInRow,
      $$GoalCheckInsTableFilterComposer,
      $$GoalCheckInsTableOrderingComposer,
      $$GoalCheckInsTableAnnotationComposer,
      $$GoalCheckInsTableCreateCompanionBuilder,
      $$GoalCheckInsTableUpdateCompanionBuilder,
      (GoalCheckInRow, $$GoalCheckInsTableReferences),
      GoalCheckInRow,
      PrefetchHooks Function({bool goalId})
    >;
typedef $$ChallengeStatesTableCreateCompanionBuilder =
    ChallengeStatesCompanion Function({
      required String challengeId,
      required ChallengeStatus status,
      Value<String> solutionNotes,
      Value<DateTime?> startedAt,
      Value<CalendarDate?> completedOn,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ChallengeStatesTableUpdateCompanionBuilder =
    ChallengeStatesCompanion Function({
      Value<String> challengeId,
      Value<ChallengeStatus> status,
      Value<String> solutionNotes,
      Value<DateTime?> startedAt,
      Value<CalendarDate?> completedOn,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ChallengeStatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChallengeStatesTable,
          ChallengeStateRow
        > {
  $$ChallengeStatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChallengesTable _challengeIdTable(_$AppDatabase db) => db.challenges
      .createAlias('challenge_states__challenge_id__challenges__id');

  $$ChallengesTableProcessedTableManager get challengeId {
    final $_column = $_itemColumn<String>('challenge_id')!;

    final manager = $$ChallengesTableTableManager(
      $_db,
      $_db.challenges,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_challengeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChallengeStatesTableFilterComposer
    extends Composer<_$AppDatabase, $ChallengeStatesTable> {
  $$ChallengeStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<ChallengeStatus, ChallengeStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get solutionNotes => $composableBuilder(
    column: $table.solutionNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CalendarDate?, CalendarDate, int>
  get completedOn => $composableBuilder(
    column: $table.completedOn,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ChallengesTableFilterComposer get challengeId {
    final $$ChallengesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.challengeId,
      referencedTable: $db.challenges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChallengesTableFilterComposer(
            $db: $db,
            $table: $db.challenges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChallengeStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChallengeStatesTable> {
  $$ChallengeStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get solutionNotes => $composableBuilder(
    column: $table.solutionNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedOn => $composableBuilder(
    column: $table.completedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChallengesTableOrderingComposer get challengeId {
    final $$ChallengesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.challengeId,
      referencedTable: $db.challenges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChallengesTableOrderingComposer(
            $db: $db,
            $table: $db.challenges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChallengeStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChallengeStatesTable> {
  $$ChallengeStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<ChallengeStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get solutionNotes => $composableBuilder(
    column: $table.solutionNotes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CalendarDate?, int> get completedOn =>
      $composableBuilder(
        column: $table.completedOn,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ChallengesTableAnnotationComposer get challengeId {
    final $$ChallengesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.challengeId,
      referencedTable: $db.challenges,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChallengesTableAnnotationComposer(
            $db: $db,
            $table: $db.challenges,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChallengeStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChallengeStatesTable,
          ChallengeStateRow,
          $$ChallengeStatesTableFilterComposer,
          $$ChallengeStatesTableOrderingComposer,
          $$ChallengeStatesTableAnnotationComposer,
          $$ChallengeStatesTableCreateCompanionBuilder,
          $$ChallengeStatesTableUpdateCompanionBuilder,
          (ChallengeStateRow, $$ChallengeStatesTableReferences),
          ChallengeStateRow,
          PrefetchHooks Function({bool challengeId})
        > {
  $$ChallengeStatesTableTableManager(
    _$AppDatabase db,
    $ChallengeStatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChallengeStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChallengeStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChallengeStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> challengeId = const Value.absent(),
                Value<ChallengeStatus> status = const Value.absent(),
                Value<String> solutionNotes = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<CalendarDate?> completedOn = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChallengeStatesCompanion(
                challengeId: challengeId,
                status: status,
                solutionNotes: solutionNotes,
                startedAt: startedAt,
                completedOn: completedOn,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String challengeId,
                required ChallengeStatus status,
                Value<String> solutionNotes = const Value.absent(),
                Value<DateTime?> startedAt = const Value.absent(),
                Value<CalendarDate?> completedOn = const Value.absent(),
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ChallengeStatesCompanion.insert(
                challengeId: challengeId,
                status: status,
                solutionNotes: solutionNotes,
                startedAt: startedAt,
                completedOn: completedOn,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ChallengeStatesTable, ChallengeStateRow>(table),
                  $$ChallengeStatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({challengeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (challengeId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.challengeId,
                        referencedTable: $$ChallengeStatesTableReferences
                            ._challengeIdTable(db),
                        referencedColumn: $$ChallengeStatesTableReferences
                            ._challengeIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChallengeStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChallengeStatesTable,
      ChallengeStateRow,
      $$ChallengeStatesTableFilterComposer,
      $$ChallengeStatesTableOrderingComposer,
      $$ChallengeStatesTableAnnotationComposer,
      $$ChallengeStatesTableCreateCompanionBuilder,
      $$ChallengeStatesTableUpdateCompanionBuilder,
      (ChallengeStateRow, $$ChallengeStatesTableReferences),
      ChallengeStateRow,
      PrefetchHooks Function({bool challengeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $SearchIndexTableManager get searchIndex =>
      $SearchIndexTableManager(_db, _db.searchIndex);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db, _db.roadmaps);
  $$RoadmapSectionsTableTableManager get roadmapSections =>
      $$RoadmapSectionsTableTableManager(_db, _db.roadmapSections);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$ResourcesTableTableManager get resources =>
      $$ResourcesTableTableManager(_db, _db.resources);
  $$ChallengesTableTableManager get challenges =>
      $$ChallengesTableTableManager(_db, _db.challenges);
  $$TopicProgressTableTableManager get topicProgress =>
      $$TopicProgressTableTableManager(_db, _db.topicProgress);
  $$TopicBookmarksTableTableManager get topicBookmarks =>
      $$TopicBookmarksTableTableManager(_db, _db.topicBookmarks);
  $$ResourceBookmarksTableTableManager get resourceBookmarks =>
      $$ResourceBookmarksTableTableManager(_db, _db.resourceBookmarks);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$GoalCheckInsTableTableManager get goalCheckIns =>
      $$GoalCheckInsTableTableManager(_db, _db.goalCheckIns);
  $$ChallengeStatesTableTableManager get challengeStates =>
      $$ChallengeStatesTableTableManager(_db, _db.challengeStates);
}
