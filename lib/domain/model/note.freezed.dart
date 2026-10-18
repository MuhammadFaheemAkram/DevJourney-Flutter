// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Note {

 String get id; String get title;/// Markdown.
 String get content; String? get topicId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteCopyWith<Note> get copyWith => _$NoteCopyWithImpl<Note>(this as Note, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Note;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Note&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.topicId, _this.topicId) || other.topicId == _this.topicId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}


@override
int get hashCode {
  final _this = this as Note;
  return Object.hash(runtimeType,_this.id,_this.title,_this.content,_this.topicId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Note;
  return 'Note(id: ${_this.id}, title: ${_this.title}, content: ${_this.content}, topicId: ${_this.topicId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $NoteCopyWith<$Res>  {
  factory $NoteCopyWith(Note value, $Res Function(Note) _then) = _$NoteCopyWithImpl;
@useResult
$Res call({
 String id, String title, String content, String? topicId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$NoteCopyWithImpl<$Res>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._self, this._then);

  final Note _self;
  final $Res Function(Note) _then;

/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? topicId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Note(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Note].
extension NotePatterns on Note {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Note value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Note value)  $default,){
final _that = this;
switch (_that) {
case _Note():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Note value)?  $default,){
final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String content,  String? topicId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.topicId,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String content,  String? topicId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Note():
return $default(_that.id,_that.title,_that.content,_that.topicId,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String content,  String? topicId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.topicId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Note implements Note {
  const _Note({required this.id, required this.title, required this.content, this.topicId, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String title;
/// Markdown.
@override final  String content;
@override final  String? topicId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteCopyWith<_Note> get copyWith => __$NoteCopyWithImpl<_Note>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Note&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,content,topicId,createdAt,updatedAt);
}

@override
String toString() {
    return 'Note(id: $id, title: $title, content: $content, topicId: $topicId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$NoteCopyWith(_Note value, $Res Function(_Note) _then) = __$NoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String content, String? topicId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$NoteCopyWithImpl<$Res>
    implements _$NoteCopyWith<$Res> {
  __$NoteCopyWithImpl(this._self, this._then);

  final _Note _self;
  final $Res Function(_Note) _then;

/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? topicId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Note(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$NoteItem {

 Note get note; String? get topicTitle;
/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteItemCopyWith<NoteItem> get copyWith => _$NoteItemCopyWithImpl<NoteItem>(this as NoteItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NoteItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteItem&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.topicTitle, _this.topicTitle) || other.topicTitle == _this.topicTitle));
}


@override
int get hashCode {
  final _this = this as NoteItem;
  return Object.hash(runtimeType,_this.note,_this.topicTitle);
}

@override
String toString() {
  final _this = this as NoteItem;
  return 'NoteItem(note: ${_this.note}, topicTitle: ${_this.topicTitle})';
}


}

/// @nodoc
abstract mixin class $NoteItemCopyWith<$Res>  {
  factory $NoteItemCopyWith(NoteItem value, $Res Function(NoteItem) _then) = _$NoteItemCopyWithImpl;
@useResult
$Res call({
 Note note, String? topicTitle
});


$NoteCopyWith<$Res> get note;

}
/// @nodoc
class _$NoteItemCopyWithImpl<$Res>
    implements $NoteItemCopyWith<$Res> {
  _$NoteItemCopyWithImpl(this._self, this._then);

  final NoteItem _self;
  final $Res Function(NoteItem) _then;

/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? note = null,Object? topicTitle = freezed,}) {
  return _then(NoteItem(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note,topicTitle: freezed == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res> get note {
  
  return $NoteCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteItem].
extension NoteItemPatterns on NoteItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteItem value)  $default,){
final _that = this;
switch (_that) {
case _NoteItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteItem value)?  $default,){
final _that = this;
switch (_that) {
case _NoteItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Note note,  String? topicTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteItem() when $default != null:
return $default(_that.note,_that.topicTitle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Note note,  String? topicTitle)  $default,) {final _that = this;
switch (_that) {
case _NoteItem():
return $default(_that.note,_that.topicTitle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Note note,  String? topicTitle)?  $default,) {final _that = this;
switch (_that) {
case _NoteItem() when $default != null:
return $default(_that.note,_that.topicTitle);case _:
  return null;

}
}

}

/// @nodoc


class _NoteItem implements NoteItem {
  const _NoteItem({required this.note, this.topicTitle});
  

@override final  Note note;
@override final  String? topicTitle;

/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteItemCopyWith<_NoteItem> get copyWith => __$NoteItemCopyWithImpl<_NoteItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteItem&&(identical(other.note, note) || other.note == note)&&(identical(other.topicTitle, topicTitle) || other.topicTitle == topicTitle));
}


@override
int get hashCode {
    return Object.hash(runtimeType,note,topicTitle);
}

@override
String toString() {
    return 'NoteItem(note: $note, topicTitle: $topicTitle)';
}


}

/// @nodoc
abstract mixin class _$NoteItemCopyWith<$Res> implements $NoteItemCopyWith<$Res> {
  factory _$NoteItemCopyWith(_NoteItem value, $Res Function(_NoteItem) _then) = __$NoteItemCopyWithImpl;
@override @useResult
$Res call({
 Note note, String? topicTitle
});


@override $NoteCopyWith<$Res> get note;

}
/// @nodoc
class __$NoteItemCopyWithImpl<$Res>
    implements _$NoteItemCopyWith<$Res> {
  __$NoteItemCopyWithImpl(this._self, this._then);

  final _NoteItem _self;
  final $Res Function(_NoteItem) _then;

/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? note = null,Object? topicTitle = freezed,}) {
  return _then(_NoteItem(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note,topicTitle: freezed == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NoteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res> get note {
  
  return $NoteCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc
mixin _$NoteDraft {

 String get title; String get content; String? get topicId;
/// Create a copy of NoteDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteDraftCopyWith<NoteDraft> get copyWith => _$NoteDraftCopyWithImpl<NoteDraft>(this as NoteDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NoteDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteDraft&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.topicId, _this.topicId) || other.topicId == _this.topicId));
}


@override
int get hashCode {
  final _this = this as NoteDraft;
  return Object.hash(runtimeType,_this.title,_this.content,_this.topicId);
}

@override
String toString() {
  final _this = this as NoteDraft;
  return 'NoteDraft(title: ${_this.title}, content: ${_this.content}, topicId: ${_this.topicId})';
}


}

/// @nodoc
abstract mixin class $NoteDraftCopyWith<$Res>  {
  factory $NoteDraftCopyWith(NoteDraft value, $Res Function(NoteDraft) _then) = _$NoteDraftCopyWithImpl;
@useResult
$Res call({
 String title, String content, String? topicId
});




}
/// @nodoc
class _$NoteDraftCopyWithImpl<$Res>
    implements $NoteDraftCopyWith<$Res> {
  _$NoteDraftCopyWithImpl(this._self, this._then);

  final NoteDraft _self;
  final $Res Function(NoteDraft) _then;

/// Create a copy of NoteDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? topicId = freezed,}) {
  return _then(NoteDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteDraft].
extension NoteDraftPatterns on NoteDraft {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteDraft() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteDraft value)  $default,){
final _that = this;
switch (_that) {
case _NoteDraft():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteDraft value)?  $default,){
final _that = this;
switch (_that) {
case _NoteDraft() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  String? topicId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteDraft() when $default != null:
return $default(_that.title,_that.content,_that.topicId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  String? topicId)  $default,) {final _that = this;
switch (_that) {
case _NoteDraft():
return $default(_that.title,_that.content,_that.topicId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  String? topicId)?  $default,) {final _that = this;
switch (_that) {
case _NoteDraft() when $default != null:
return $default(_that.title,_that.content,_that.topicId);case _:
  return null;

}
}

}

/// @nodoc


class _NoteDraft implements NoteDraft {
  const _NoteDraft({required this.title, required this.content, this.topicId});
  

@override final  String title;
@override final  String content;
@override final  String? topicId;

/// Create a copy of NoteDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteDraftCopyWith<_NoteDraft> get copyWith => __$NoteDraftCopyWithImpl<_NoteDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteDraft&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.topicId, topicId) || other.topicId == topicId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,content,topicId);
}

@override
String toString() {
    return 'NoteDraft(title: $title, content: $content, topicId: $topicId)';
}


}

/// @nodoc
abstract mixin class _$NoteDraftCopyWith<$Res> implements $NoteDraftCopyWith<$Res> {
  factory _$NoteDraftCopyWith(_NoteDraft value, $Res Function(_NoteDraft) _then) = __$NoteDraftCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, String? topicId
});




}
/// @nodoc
class __$NoteDraftCopyWithImpl<$Res>
    implements _$NoteDraftCopyWith<$Res> {
  __$NoteDraftCopyWithImpl(this._self, this._then);

  final _NoteDraft _self;
  final $Res Function(_NoteDraft) _then;

/// Create a copy of NoteDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? topicId = freezed,}) {
  return _then(_NoteDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
