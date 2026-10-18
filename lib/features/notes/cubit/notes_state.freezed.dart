// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotesState {

 DateTime get now; NotesStatus get status; List<NoteItem> get notes; String get query;/// The note just deleted, for the Undo SnackBar; [deletedSerial] makes
/// each deletion distinct.
 Note? get deleted; int get deletedSerial; String? get errorMessage; int get errorSerial;
/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotesStateCopyWith<NotesState> get copyWith => _$NotesStateCopyWithImpl<NotesState>(this as NotesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NotesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotesState&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.notes, _this.notes)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.deleted, _this.deleted) || other.deleted == _this.deleted)&&(identical(other.deletedSerial, _this.deletedSerial) || other.deletedSerial == _this.deletedSerial)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.errorSerial, _this.errorSerial) || other.errorSerial == _this.errorSerial));
}


@override
int get hashCode {
  final _this = this as NotesState;
  return Object.hash(runtimeType,_this.now,_this.status,const DeepCollectionEquality().hash(_this.notes),_this.query,_this.deleted,_this.deletedSerial,_this.errorMessage,_this.errorSerial);
}

@override
String toString() {
  final _this = this as NotesState;
  return 'NotesState(now: ${_this.now}, status: ${_this.status}, notes: ${_this.notes}, query: ${_this.query}, deleted: ${_this.deleted}, deletedSerial: ${_this.deletedSerial}, errorMessage: ${_this.errorMessage}, errorSerial: ${_this.errorSerial})';
}


}

/// @nodoc
abstract mixin class $NotesStateCopyWith<$Res>  {
  factory $NotesStateCopyWith(NotesState value, $Res Function(NotesState) _then) = _$NotesStateCopyWithImpl;
@useResult
$Res call({
 DateTime now, NotesStatus status, List<NoteItem> notes, String query, Note? deleted, int deletedSerial, String? errorMessage, int errorSerial
});


$NoteCopyWith<$Res>? get deleted;

}
/// @nodoc
class _$NotesStateCopyWithImpl<$Res>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._self, this._then);

  final NotesState _self;
  final $Res Function(NotesState) _then;

/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? now = null,Object? status = null,Object? notes = null,Object? query = null,Object? deleted = freezed,Object? deletedSerial = null,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(NotesState(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotesStatus,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as Note?,deletedSerial: null == deletedSerial ? _self.deletedSerial : deletedSerial // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get deleted {
    if (_self.deleted == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.deleted!, (value) {
    return _then(_self.copyWith(deleted: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotesState].
extension NotesStatePatterns on NotesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotesState value)  $default,){
final _that = this;
switch (_that) {
case _NotesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotesState value)?  $default,){
final _that = this;
switch (_that) {
case _NotesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime now,  NotesStatus status,  List<NoteItem> notes,  String query,  Note? deleted,  int deletedSerial,  String? errorMessage,  int errorSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotesState() when $default != null:
return $default(_that.now,_that.status,_that.notes,_that.query,_that.deleted,_that.deletedSerial,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime now,  NotesStatus status,  List<NoteItem> notes,  String query,  Note? deleted,  int deletedSerial,  String? errorMessage,  int errorSerial)  $default,) {final _that = this;
switch (_that) {
case _NotesState():
return $default(_that.now,_that.status,_that.notes,_that.query,_that.deleted,_that.deletedSerial,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime now,  NotesStatus status,  List<NoteItem> notes,  String query,  Note? deleted,  int deletedSerial,  String? errorMessage,  int errorSerial)?  $default,) {final _that = this;
switch (_that) {
case _NotesState() when $default != null:
return $default(_that.now,_that.status,_that.notes,_that.query,_that.deleted,_that.deletedSerial,_that.errorMessage,_that.errorSerial);case _:
  return null;

}
}

}

/// @nodoc


class _NotesState implements NotesState {
  const _NotesState({required this.now, this.status = NotesStatus.loading,  List<NoteItem> notes = const <NoteItem>[], this.query = '', this.deleted, this.deletedSerial = 0, this.errorMessage, this.errorSerial = 0}): _notes = notes;
  

@override final  DateTime now;
@override@JsonKey() final  NotesStatus status;
 final  List<NoteItem> _notes;
@override@JsonKey() List<NoteItem> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

@override@JsonKey() final  String query;
/// The note just deleted, for the Undo SnackBar; [deletedSerial] makes
/// each deletion distinct.
@override final  Note? deleted;
@override@JsonKey() final  int deletedSerial;
@override final  String? errorMessage;
@override@JsonKey() final  int errorSerial;

/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotesStateCopyWith<_NotesState> get copyWith => __$NotesStateCopyWithImpl<_NotesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotesState&&(identical(other.now, now) || other.now == now)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.notes, _notes)&&(identical(other.query, query) || other.query == query)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.deletedSerial, deletedSerial) || other.deletedSerial == deletedSerial)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorSerial, errorSerial) || other.errorSerial == errorSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,now,status,const DeepCollectionEquality().hash(_notes),query,deleted,deletedSerial,errorMessage,errorSerial);
}

@override
String toString() {
    return 'NotesState(now: $now, status: $status, notes: $notes, query: $query, deleted: $deleted, deletedSerial: $deletedSerial, errorMessage: $errorMessage, errorSerial: $errorSerial)';
}


}

/// @nodoc
abstract mixin class _$NotesStateCopyWith<$Res> implements $NotesStateCopyWith<$Res> {
  factory _$NotesStateCopyWith(_NotesState value, $Res Function(_NotesState) _then) = __$NotesStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime now, NotesStatus status, List<NoteItem> notes, String query, Note? deleted, int deletedSerial, String? errorMessage, int errorSerial
});


@override $NoteCopyWith<$Res>? get deleted;

}
/// @nodoc
class __$NotesStateCopyWithImpl<$Res>
    implements _$NotesStateCopyWith<$Res> {
  __$NotesStateCopyWithImpl(this._self, this._then);

  final _NotesState _self;
  final $Res Function(_NotesState) _then;

/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? now = null,Object? status = null,Object? notes = null,Object? query = null,Object? deleted = freezed,Object? deletedSerial = null,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(_NotesState(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotesStatus,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as Note?,deletedSerial: null == deletedSerial ? _self.deletedSerial : deletedSerial // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NotesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get deleted {
    if (_self.deleted == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.deleted!, (value) {
    return _then(_self.copyWith(deleted: value));
  });
}
}

// dart format on
