// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteEditorState {

 NoteEditorStatus get status;/// What the note was when opened (empty for a new one), to tell whether
/// anything changed.
 NoteDraft get original; NoteDraft get draft;/// Every topic a note can be attached to.
 List<TopicChoice> get topics;/// Errors show under the fields only after a first Save.
 bool get showErrors; bool get saving; NoteEditorExit? get exit; String? get errorMessage; int get errorSerial;
/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteEditorStateCopyWith<NoteEditorState> get copyWith => _$NoteEditorStateCopyWithImpl<NoteEditorState>(this as NoteEditorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NoteEditorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEditorState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.original, _this.original) || other.original == _this.original)&&(identical(other.draft, _this.draft) || other.draft == _this.draft)&&const DeepCollectionEquality().equals(other.topics, _this.topics)&&(identical(other.showErrors, _this.showErrors) || other.showErrors == _this.showErrors)&&(identical(other.saving, _this.saving) || other.saving == _this.saving)&&(identical(other.exit, _this.exit) || other.exit == _this.exit)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.errorSerial, _this.errorSerial) || other.errorSerial == _this.errorSerial));
}


@override
int get hashCode {
  final _this = this as NoteEditorState;
  return Object.hash(runtimeType,_this.status,_this.original,_this.draft,const DeepCollectionEquality().hash(_this.topics),_this.showErrors,_this.saving,_this.exit,_this.errorMessage,_this.errorSerial);
}

@override
String toString() {
  final _this = this as NoteEditorState;
  return 'NoteEditorState(status: ${_this.status}, original: ${_this.original}, draft: ${_this.draft}, topics: ${_this.topics}, showErrors: ${_this.showErrors}, saving: ${_this.saving}, exit: ${_this.exit}, errorMessage: ${_this.errorMessage}, errorSerial: ${_this.errorSerial})';
}


}

/// @nodoc
abstract mixin class $NoteEditorStateCopyWith<$Res>  {
  factory $NoteEditorStateCopyWith(NoteEditorState value, $Res Function(NoteEditorState) _then) = _$NoteEditorStateCopyWithImpl;
@useResult
$Res call({
 NoteEditorStatus status, NoteDraft original, NoteDraft draft, List<TopicChoice> topics, bool showErrors, bool saving, NoteEditorExit? exit, String? errorMessage, int errorSerial
});


$NoteDraftCopyWith<$Res> get original;$NoteDraftCopyWith<$Res> get draft;

}
/// @nodoc
class _$NoteEditorStateCopyWithImpl<$Res>
    implements $NoteEditorStateCopyWith<$Res> {
  _$NoteEditorStateCopyWithImpl(this._self, this._then);

  final NoteEditorState _self;
  final $Res Function(NoteEditorState) _then;

/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? original = null,Object? draft = null,Object? topics = null,Object? showErrors = null,Object? saving = null,Object? exit = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(NoteEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NoteEditorStatus,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as NoteDraft,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as NoteDraft,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicChoice>,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,exit: freezed == exit ? _self.exit : exit // ignore: cast_nullable_to_non_nullable
as NoteEditorExit?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteDraftCopyWith<$Res> get original {
  
  return $NoteDraftCopyWith<$Res>(_self.original, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteDraftCopyWith<$Res> get draft {
  
  return $NoteDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteEditorState].
extension NoteEditorStatePatterns on NoteEditorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteEditorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteEditorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteEditorState value)  $default,){
final _that = this;
switch (_that) {
case _NoteEditorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteEditorState value)?  $default,){
final _that = this;
switch (_that) {
case _NoteEditorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NoteEditorStatus status,  NoteDraft original,  NoteDraft draft,  List<TopicChoice> topics,  bool showErrors,  bool saving,  NoteEditorExit? exit,  String? errorMessage,  int errorSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteEditorState() when $default != null:
return $default(_that.status,_that.original,_that.draft,_that.topics,_that.showErrors,_that.saving,_that.exit,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NoteEditorStatus status,  NoteDraft original,  NoteDraft draft,  List<TopicChoice> topics,  bool showErrors,  bool saving,  NoteEditorExit? exit,  String? errorMessage,  int errorSerial)  $default,) {final _that = this;
switch (_that) {
case _NoteEditorState():
return $default(_that.status,_that.original,_that.draft,_that.topics,_that.showErrors,_that.saving,_that.exit,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NoteEditorStatus status,  NoteDraft original,  NoteDraft draft,  List<TopicChoice> topics,  bool showErrors,  bool saving,  NoteEditorExit? exit,  String? errorMessage,  int errorSerial)?  $default,) {final _that = this;
switch (_that) {
case _NoteEditorState() when $default != null:
return $default(_that.status,_that.original,_that.draft,_that.topics,_that.showErrors,_that.saving,_that.exit,_that.errorMessage,_that.errorSerial);case _:
  return null;

}
}

}

/// @nodoc


class _NoteEditorState extends NoteEditorState {
  const _NoteEditorState({this.status = NoteEditorStatus.loading, this.original = const NoteDraft(title: '', content: ''), this.draft = const NoteDraft(title: '', content: ''),  List<TopicChoice> topics = const <TopicChoice>[], this.showErrors = false, this.saving = false, this.exit, this.errorMessage, this.errorSerial = 0}): _topics = topics,super._();
  

@override@JsonKey() final  NoteEditorStatus status;
/// What the note was when opened (empty for a new one), to tell whether
/// anything changed.
@override@JsonKey() final  NoteDraft original;
@override@JsonKey() final  NoteDraft draft;
/// Every topic a note can be attached to.
 final  List<TopicChoice> _topics;
/// Every topic a note can be attached to.
@override@JsonKey() List<TopicChoice> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}

/// Errors show under the fields only after a first Save.
@override@JsonKey() final  bool showErrors;
@override@JsonKey() final  bool saving;
@override final  NoteEditorExit? exit;
@override final  String? errorMessage;
@override@JsonKey() final  int errorSerial;

/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteEditorStateCopyWith<_NoteEditorState> get copyWith => __$NoteEditorStateCopyWithImpl<_NoteEditorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteEditorState&&(identical(other.status, status) || other.status == status)&&(identical(other.original, original) || other.original == original)&&(identical(other.draft, draft) || other.draft == draft)&&const DeepCollectionEquality().equals(other.topics, _topics)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.exit, exit) || other.exit == exit)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorSerial, errorSerial) || other.errorSerial == errorSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,original,draft,const DeepCollectionEquality().hash(_topics),showErrors,saving,exit,errorMessage,errorSerial);
}

@override
String toString() {
    return 'NoteEditorState(status: $status, original: $original, draft: $draft, topics: $topics, showErrors: $showErrors, saving: $saving, exit: $exit, errorMessage: $errorMessage, errorSerial: $errorSerial)';
}


}

/// @nodoc
abstract mixin class _$NoteEditorStateCopyWith<$Res> implements $NoteEditorStateCopyWith<$Res> {
  factory _$NoteEditorStateCopyWith(_NoteEditorState value, $Res Function(_NoteEditorState) _then) = __$NoteEditorStateCopyWithImpl;
@override @useResult
$Res call({
 NoteEditorStatus status, NoteDraft original, NoteDraft draft, List<TopicChoice> topics, bool showErrors, bool saving, NoteEditorExit? exit, String? errorMessage, int errorSerial
});


@override $NoteDraftCopyWith<$Res> get original;@override $NoteDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$NoteEditorStateCopyWithImpl<$Res>
    implements _$NoteEditorStateCopyWith<$Res> {
  __$NoteEditorStateCopyWithImpl(this._self, this._then);

  final _NoteEditorState _self;
  final $Res Function(_NoteEditorState) _then;

/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? original = null,Object? draft = null,Object? topics = null,Object? showErrors = null,Object? saving = null,Object? exit = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(_NoteEditorState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NoteEditorStatus,original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as NoteDraft,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as NoteDraft,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicChoice>,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,exit: freezed == exit ? _self.exit : exit // ignore: cast_nullable_to_non_nullable
as NoteEditorExit?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteDraftCopyWith<$Res> get original {
  
  return $NoteDraftCopyWith<$Res>(_self.original, (value) {
    return _then(_self.copyWith(original: value));
  });
}/// Create a copy of NoteEditorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteDraftCopyWith<$Res> get draft {
  
  return $NoteDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

// dart format on
