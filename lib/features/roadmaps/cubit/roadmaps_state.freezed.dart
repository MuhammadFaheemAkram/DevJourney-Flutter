// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roadmaps_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoadmapsState {

/// `null` until the roadmaps arrive.
 List<RoadmapProgress>? get roadmaps; String? get activeRoadmapId;/// The search text and the category filter: applied in memory, at once.
/// Four roadmaps don't need a debounced query.
 String get query; RoadmapCategory? get category; String? get errorMessage;/// A message for the SnackBar (a sync's result); [messageSerial] makes
/// each one distinct.
 String? get message; int get messageSerial;
/// Create a copy of RoadmapsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapsStateCopyWith<RoadmapsState> get copyWith => _$RoadmapsStateCopyWithImpl<RoadmapsState>(this as RoadmapsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoadmapsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapsState&&const DeepCollectionEquality().equals(other.roadmaps, _this.roadmaps)&&(identical(other.activeRoadmapId, _this.activeRoadmapId) || other.activeRoadmapId == _this.activeRoadmapId)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as RoadmapsState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.roadmaps),_this.activeRoadmapId,_this.query,_this.category,_this.errorMessage,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as RoadmapsState;
  return 'RoadmapsState(roadmaps: ${_this.roadmaps}, activeRoadmapId: ${_this.activeRoadmapId}, query: ${_this.query}, category: ${_this.category}, errorMessage: ${_this.errorMessage}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $RoadmapsStateCopyWith<$Res>  {
  factory $RoadmapsStateCopyWith(RoadmapsState value, $Res Function(RoadmapsState) _then) = _$RoadmapsStateCopyWithImpl;
@useResult
$Res call({
 List<RoadmapProgress>? roadmaps, String? activeRoadmapId, String query, RoadmapCategory? category, String? errorMessage, String? message, int messageSerial
});




}
/// @nodoc
class _$RoadmapsStateCopyWithImpl<$Res>
    implements $RoadmapsStateCopyWith<$Res> {
  _$RoadmapsStateCopyWithImpl(this._self, this._then);

  final RoadmapsState _self;
  final $Res Function(RoadmapsState) _then;

/// Create a copy of RoadmapsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roadmaps = freezed,Object? activeRoadmapId = freezed,Object? query = null,Object? category = freezed,Object? errorMessage = freezed,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(RoadmapsState(
roadmaps: freezed == roadmaps ? _self.roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>?,activeRoadmapId: freezed == activeRoadmapId ? _self.activeRoadmapId : activeRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoadmapCategory?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadmapsState].
extension RoadmapsStatePatterns on RoadmapsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapsState value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapsState value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoadmapProgress>? roadmaps,  String? activeRoadmapId,  String query,  RoadmapCategory? category,  String? errorMessage,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapsState() when $default != null:
return $default(_that.roadmaps,_that.activeRoadmapId,_that.query,_that.category,_that.errorMessage,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoadmapProgress>? roadmaps,  String? activeRoadmapId,  String query,  RoadmapCategory? category,  String? errorMessage,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _RoadmapsState():
return $default(_that.roadmaps,_that.activeRoadmapId,_that.query,_that.category,_that.errorMessage,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoadmapProgress>? roadmaps,  String? activeRoadmapId,  String query,  RoadmapCategory? category,  String? errorMessage,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapsState() when $default != null:
return $default(_that.roadmaps,_that.activeRoadmapId,_that.query,_that.category,_that.errorMessage,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _RoadmapsState extends RoadmapsState {
  const _RoadmapsState({ List<RoadmapProgress>? roadmaps, this.activeRoadmapId, this.query = '', this.category, this.errorMessage, this.message, this.messageSerial = 0}): _roadmaps = roadmaps,super._();
  

/// `null` until the roadmaps arrive.
 final  List<RoadmapProgress>? _roadmaps;
/// `null` until the roadmaps arrive.
@override List<RoadmapProgress>? get roadmaps {
  final value = _roadmaps;
  if (value == null) return null;
  if (_roadmaps is EqualUnmodifiableListView) return _roadmaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? activeRoadmapId;
/// The search text and the category filter: applied in memory, at once.
/// Four roadmaps don't need a debounced query.
@override@JsonKey() final  String query;
@override final  RoadmapCategory? category;
@override final  String? errorMessage;
/// A message for the SnackBar (a sync's result); [messageSerial] makes
/// each one distinct.
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of RoadmapsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapsStateCopyWith<_RoadmapsState> get copyWith => __$RoadmapsStateCopyWithImpl<_RoadmapsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapsState&&const DeepCollectionEquality().equals(other.roadmaps, _roadmaps)&&(identical(other.activeRoadmapId, activeRoadmapId) || other.activeRoadmapId == activeRoadmapId)&&(identical(other.query, query) || other.query == query)&&(identical(other.category, category) || other.category == category)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_roadmaps),activeRoadmapId,query,category,errorMessage,message,messageSerial);
}

@override
String toString() {
    return 'RoadmapsState(roadmaps: $roadmaps, activeRoadmapId: $activeRoadmapId, query: $query, category: $category, errorMessage: $errorMessage, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$RoadmapsStateCopyWith<$Res> implements $RoadmapsStateCopyWith<$Res> {
  factory _$RoadmapsStateCopyWith(_RoadmapsState value, $Res Function(_RoadmapsState) _then) = __$RoadmapsStateCopyWithImpl;
@override @useResult
$Res call({
 List<RoadmapProgress>? roadmaps, String? activeRoadmapId, String query, RoadmapCategory? category, String? errorMessage, String? message, int messageSerial
});




}
/// @nodoc
class __$RoadmapsStateCopyWithImpl<$Res>
    implements _$RoadmapsStateCopyWith<$Res> {
  __$RoadmapsStateCopyWithImpl(this._self, this._then);

  final _RoadmapsState _self;
  final $Res Function(_RoadmapsState) _then;

/// Create a copy of RoadmapsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roadmaps = freezed,Object? activeRoadmapId = freezed,Object? query = null,Object? category = freezed,Object? errorMessage = freezed,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_RoadmapsState(
roadmaps: freezed == roadmaps ? _self._roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>?,activeRoadmapId: freezed == activeRoadmapId ? _self.activeRoadmapId : activeRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoadmapCategory?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
