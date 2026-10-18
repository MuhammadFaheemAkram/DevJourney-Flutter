// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicDetailState {

/// When the state was made: "today" for the completion, "5 min ago"
/// for notes.
 DateTime get now; TopicDetailStatus get status; TopicDetails? get details;/// The resources for this topic, in catalog order.
 List<ResourceItem> get resources;/// The notes attached to this topic, newest edit first.
 List<NoteItem> get notes;/// Why the last change failed; [errorSerial] makes each failure
/// distinct.
 String? get errorMessage; int get errorSerial;
/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDetailStateCopyWith<TopicDetailState> get copyWith => _$TopicDetailStateCopyWithImpl<TopicDetailState>(this as TopicDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopicDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetailState&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.details, _this.details) || other.details == _this.details)&&const DeepCollectionEquality().equals(other.resources, _this.resources)&&const DeepCollectionEquality().equals(other.notes, _this.notes)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.errorSerial, _this.errorSerial) || other.errorSerial == _this.errorSerial));
}


@override
int get hashCode {
  final _this = this as TopicDetailState;
  return Object.hash(runtimeType,_this.now,_this.status,_this.details,const DeepCollectionEquality().hash(_this.resources),const DeepCollectionEquality().hash(_this.notes),_this.errorMessage,_this.errorSerial);
}

@override
String toString() {
  final _this = this as TopicDetailState;
  return 'TopicDetailState(now: ${_this.now}, status: ${_this.status}, details: ${_this.details}, resources: ${_this.resources}, notes: ${_this.notes}, errorMessage: ${_this.errorMessage}, errorSerial: ${_this.errorSerial})';
}


}

/// @nodoc
abstract mixin class $TopicDetailStateCopyWith<$Res>  {
  factory $TopicDetailStateCopyWith(TopicDetailState value, $Res Function(TopicDetailState) _then) = _$TopicDetailStateCopyWithImpl;
@useResult
$Res call({
 DateTime now, TopicDetailStatus status, TopicDetails? details, List<ResourceItem> resources, List<NoteItem> notes, String? errorMessage, int errorSerial
});


$TopicDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class _$TopicDetailStateCopyWithImpl<$Res>
    implements $TopicDetailStateCopyWith<$Res> {
  _$TopicDetailStateCopyWithImpl(this._self, this._then);

  final TopicDetailState _self;
  final $Res Function(TopicDetailState) _then;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? now = null,Object? status = null,Object? details = freezed,Object? resources = null,Object? notes = null,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(TopicDetailState(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as TopicDetails?,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $TopicDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicDetailState].
extension TopicDetailStatePatterns on TopicDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TopicDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime now,  TopicDetailStatus status,  TopicDetails? details,  List<ResourceItem> resources,  List<NoteItem> notes,  String? errorMessage,  int errorSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.now,_that.status,_that.details,_that.resources,_that.notes,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime now,  TopicDetailStatus status,  TopicDetails? details,  List<ResourceItem> resources,  List<NoteItem> notes,  String? errorMessage,  int errorSerial)  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState():
return $default(_that.now,_that.status,_that.details,_that.resources,_that.notes,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime now,  TopicDetailStatus status,  TopicDetails? details,  List<ResourceItem> resources,  List<NoteItem> notes,  String? errorMessage,  int errorSerial)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.now,_that.status,_that.details,_that.resources,_that.notes,_that.errorMessage,_that.errorSerial);case _:
  return null;

}
}

}

/// @nodoc


class _TopicDetailState extends TopicDetailState {
  const _TopicDetailState({required this.now, this.status = TopicDetailStatus.loading, this.details,  List<ResourceItem> resources = const <ResourceItem>[],  List<NoteItem> notes = const <NoteItem>[], this.errorMessage, this.errorSerial = 0}): _resources = resources,_notes = notes,super._();
  

/// When the state was made: "today" for the completion, "5 min ago"
/// for notes.
@override final  DateTime now;
@override@JsonKey() final  TopicDetailStatus status;
@override final  TopicDetails? details;
/// The resources for this topic, in catalog order.
 final  List<ResourceItem> _resources;
/// The resources for this topic, in catalog order.
@override@JsonKey() List<ResourceItem> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}

/// The notes attached to this topic, newest edit first.
 final  List<NoteItem> _notes;
/// The notes attached to this topic, newest edit first.
@override@JsonKey() List<NoteItem> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}

/// Why the last change failed; [errorSerial] makes each failure
/// distinct.
@override final  String? errorMessage;
@override@JsonKey() final  int errorSerial;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDetailStateCopyWith<_TopicDetailState> get copyWith => __$TopicDetailStateCopyWithImpl<_TopicDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetailState&&(identical(other.now, now) || other.now == now)&&(identical(other.status, status) || other.status == status)&&(identical(other.details, details) || other.details == details)&&const DeepCollectionEquality().equals(other.resources, _resources)&&const DeepCollectionEquality().equals(other.notes, _notes)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorSerial, errorSerial) || other.errorSerial == errorSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,now,status,details,const DeepCollectionEquality().hash(_resources),const DeepCollectionEquality().hash(_notes),errorMessage,errorSerial);
}

@override
String toString() {
    return 'TopicDetailState(now: $now, status: $status, details: $details, resources: $resources, notes: $notes, errorMessage: $errorMessage, errorSerial: $errorSerial)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailStateCopyWith<$Res> implements $TopicDetailStateCopyWith<$Res> {
  factory _$TopicDetailStateCopyWith(_TopicDetailState value, $Res Function(_TopicDetailState) _then) = __$TopicDetailStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime now, TopicDetailStatus status, TopicDetails? details, List<ResourceItem> resources, List<NoteItem> notes, String? errorMessage, int errorSerial
});


@override $TopicDetailsCopyWith<$Res>? get details;

}
/// @nodoc
class __$TopicDetailStateCopyWithImpl<$Res>
    implements _$TopicDetailStateCopyWith<$Res> {
  __$TopicDetailStateCopyWithImpl(this._self, this._then);

  final _TopicDetailState _self;
  final $Res Function(_TopicDetailState) _then;

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? now = null,Object? status = null,Object? details = freezed,Object? resources = null,Object? notes = null,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(_TopicDetailState(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as TopicDetails?,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TopicDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicDetailsCopyWith<$Res>? get details {
    if (_self.details == null) {
    return null;
  }

  return $TopicDetailsCopyWith<$Res>(_self.details!, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}

// dart format on
