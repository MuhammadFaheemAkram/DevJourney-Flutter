// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roadmap_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoadmapDetailState {

 RoadmapDetailStatus get status;/// Sections → topics, with progress.
 RoadmapPath? get path;/// Which sections are open. Kept here, not in the widgets, so it
/// survives every rebuild the live path causes.
 Set<String> get expandedSectionIds; bool get isActive;/// A message for the SnackBar; [messageSerial] makes each one distinct.
 String? get message; int get messageSerial;
/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapDetailStateCopyWith<RoadmapDetailState> get copyWith => _$RoadmapDetailStateCopyWithImpl<RoadmapDetailState>(this as RoadmapDetailState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoadmapDetailState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapDetailState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.path, _this.path) || other.path == _this.path)&&const DeepCollectionEquality().equals(other.expandedSectionIds, _this.expandedSectionIds)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as RoadmapDetailState;
  return Object.hash(runtimeType,_this.status,_this.path,const DeepCollectionEquality().hash(_this.expandedSectionIds),_this.isActive,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as RoadmapDetailState;
  return 'RoadmapDetailState(status: ${_this.status}, path: ${_this.path}, expandedSectionIds: ${_this.expandedSectionIds}, isActive: ${_this.isActive}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $RoadmapDetailStateCopyWith<$Res>  {
  factory $RoadmapDetailStateCopyWith(RoadmapDetailState value, $Res Function(RoadmapDetailState) _then) = _$RoadmapDetailStateCopyWithImpl;
@useResult
$Res call({
 RoadmapDetailStatus status, RoadmapPath? path, Set<String> expandedSectionIds, bool isActive, String? message, int messageSerial
});


$RoadmapPathCopyWith<$Res>? get path;

}
/// @nodoc
class _$RoadmapDetailStateCopyWithImpl<$Res>
    implements $RoadmapDetailStateCopyWith<$Res> {
  _$RoadmapDetailStateCopyWithImpl(this._self, this._then);

  final RoadmapDetailState _self;
  final $Res Function(RoadmapDetailState) _then;

/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? path = freezed,Object? expandedSectionIds = null,Object? isActive = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(RoadmapDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoadmapDetailStatus,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as RoadmapPath?,expandedSectionIds: null == expandedSectionIds ? _self.expandedSectionIds : expandedSectionIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapPathCopyWith<$Res>? get path {
    if (_self.path == null) {
    return null;
  }

  return $RoadmapPathCopyWith<$Res>(_self.path!, (value) {
    return _then(_self.copyWith(path: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadmapDetailState].
extension RoadmapDetailStatePatterns on RoadmapDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapDetailState value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoadmapDetailStatus status,  RoadmapPath? path,  Set<String> expandedSectionIds,  bool isActive,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapDetailState() when $default != null:
return $default(_that.status,_that.path,_that.expandedSectionIds,_that.isActive,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoadmapDetailStatus status,  RoadmapPath? path,  Set<String> expandedSectionIds,  bool isActive,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _RoadmapDetailState():
return $default(_that.status,_that.path,_that.expandedSectionIds,_that.isActive,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoadmapDetailStatus status,  RoadmapPath? path,  Set<String> expandedSectionIds,  bool isActive,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapDetailState() when $default != null:
return $default(_that.status,_that.path,_that.expandedSectionIds,_that.isActive,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _RoadmapDetailState implements RoadmapDetailState {
  const _RoadmapDetailState({this.status = RoadmapDetailStatus.loading, this.path,  Set<String> expandedSectionIds = const <String>{}, this.isActive = false, this.message, this.messageSerial = 0}): _expandedSectionIds = expandedSectionIds;
  

@override@JsonKey() final  RoadmapDetailStatus status;
/// Sections → topics, with progress.
@override final  RoadmapPath? path;
/// Which sections are open. Kept here, not in the widgets, so it
/// survives every rebuild the live path causes.
 final  Set<String> _expandedSectionIds;
/// Which sections are open. Kept here, not in the widgets, so it
/// survives every rebuild the live path causes.
@override@JsonKey() Set<String> get expandedSectionIds {
  if (_expandedSectionIds is EqualUnmodifiableSetView) return _expandedSectionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedSectionIds);
}

@override@JsonKey() final  bool isActive;
/// A message for the SnackBar; [messageSerial] makes each one distinct.
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapDetailStateCopyWith<_RoadmapDetailState> get copyWith => __$RoadmapDetailStateCopyWithImpl<_RoadmapDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.expandedSectionIds, _expandedSectionIds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,path,const DeepCollectionEquality().hash(_expandedSectionIds),isActive,message,messageSerial);
}

@override
String toString() {
    return 'RoadmapDetailState(status: $status, path: $path, expandedSectionIds: $expandedSectionIds, isActive: $isActive, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$RoadmapDetailStateCopyWith<$Res> implements $RoadmapDetailStateCopyWith<$Res> {
  factory _$RoadmapDetailStateCopyWith(_RoadmapDetailState value, $Res Function(_RoadmapDetailState) _then) = __$RoadmapDetailStateCopyWithImpl;
@override @useResult
$Res call({
 RoadmapDetailStatus status, RoadmapPath? path, Set<String> expandedSectionIds, bool isActive, String? message, int messageSerial
});


@override $RoadmapPathCopyWith<$Res>? get path;

}
/// @nodoc
class __$RoadmapDetailStateCopyWithImpl<$Res>
    implements _$RoadmapDetailStateCopyWith<$Res> {
  __$RoadmapDetailStateCopyWithImpl(this._self, this._then);

  final _RoadmapDetailState _self;
  final $Res Function(_RoadmapDetailState) _then;

/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? path = freezed,Object? expandedSectionIds = null,Object? isActive = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_RoadmapDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoadmapDetailStatus,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as RoadmapPath?,expandedSectionIds: null == expandedSectionIds ? _self._expandedSectionIds : expandedSectionIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RoadmapDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapPathCopyWith<$Res>? get path {
    if (_self.path == null) {
    return null;
  }

  return $RoadmapPathCopyWith<$Res>(_self.path!, (value) {
    return _then(_self.copyWith(path: value));
  });
}
}

// dart format on
