// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WelcomeState {

 WelcomeStatus get status; List<RoadmapProgress> get roadmaps; String? get selectedRoadmapId;/// The start in progress, if any: both buttons wait for it.
 StartChoice? get starting;/// Why the catalog failed to load, or why the last start failed.
/// [errorSerial] makes each failure distinct, so the same message twice
/// still shows twice.
 String? get errorMessage; int get errorSerial;
/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WelcomeStateCopyWith<WelcomeState> get copyWith => _$WelcomeStateCopyWithImpl<WelcomeState>(this as WelcomeState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WelcomeState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WelcomeState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.roadmaps, _this.roadmaps)&&(identical(other.selectedRoadmapId, _this.selectedRoadmapId) || other.selectedRoadmapId == _this.selectedRoadmapId)&&(identical(other.starting, _this.starting) || other.starting == _this.starting)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.errorSerial, _this.errorSerial) || other.errorSerial == _this.errorSerial));
}


@override
int get hashCode {
  final _this = this as WelcomeState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.roadmaps),_this.selectedRoadmapId,_this.starting,_this.errorMessage,_this.errorSerial);
}

@override
String toString() {
  final _this = this as WelcomeState;
  return 'WelcomeState(status: ${_this.status}, roadmaps: ${_this.roadmaps}, selectedRoadmapId: ${_this.selectedRoadmapId}, starting: ${_this.starting}, errorMessage: ${_this.errorMessage}, errorSerial: ${_this.errorSerial})';
}


}

/// @nodoc
abstract mixin class $WelcomeStateCopyWith<$Res>  {
  factory $WelcomeStateCopyWith(WelcomeState value, $Res Function(WelcomeState) _then) = _$WelcomeStateCopyWithImpl;
@useResult
$Res call({
 WelcomeStatus status, List<RoadmapProgress> roadmaps, String? selectedRoadmapId, StartChoice? starting, String? errorMessage, int errorSerial
});




}
/// @nodoc
class _$WelcomeStateCopyWithImpl<$Res>
    implements $WelcomeStateCopyWith<$Res> {
  _$WelcomeStateCopyWithImpl(this._self, this._then);

  final WelcomeState _self;
  final $Res Function(WelcomeState) _then;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? roadmaps = null,Object? selectedRoadmapId = freezed,Object? starting = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(WelcomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WelcomeStatus,roadmaps: null == roadmaps ? _self.roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>,selectedRoadmapId: freezed == selectedRoadmapId ? _self.selectedRoadmapId : selectedRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,starting: freezed == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
as StartChoice?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WelcomeState].
extension WelcomeStatePatterns on WelcomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WelcomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WelcomeState value)  $default,){
final _that = this;
switch (_that) {
case _WelcomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WelcomeState value)?  $default,){
final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WelcomeStatus status,  List<RoadmapProgress> roadmaps,  String? selectedRoadmapId,  StartChoice? starting,  String? errorMessage,  int errorSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
return $default(_that.status,_that.roadmaps,_that.selectedRoadmapId,_that.starting,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WelcomeStatus status,  List<RoadmapProgress> roadmaps,  String? selectedRoadmapId,  StartChoice? starting,  String? errorMessage,  int errorSerial)  $default,) {final _that = this;
switch (_that) {
case _WelcomeState():
return $default(_that.status,_that.roadmaps,_that.selectedRoadmapId,_that.starting,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WelcomeStatus status,  List<RoadmapProgress> roadmaps,  String? selectedRoadmapId,  StartChoice? starting,  String? errorMessage,  int errorSerial)?  $default,) {final _that = this;
switch (_that) {
case _WelcomeState() when $default != null:
return $default(_that.status,_that.roadmaps,_that.selectedRoadmapId,_that.starting,_that.errorMessage,_that.errorSerial);case _:
  return null;

}
}

}

/// @nodoc


class _WelcomeState extends WelcomeState {
  const _WelcomeState({this.status = WelcomeStatus.loading,  List<RoadmapProgress> roadmaps = const <RoadmapProgress>[], this.selectedRoadmapId, this.starting, this.errorMessage, this.errorSerial = 0}): _roadmaps = roadmaps,super._();
  

@override@JsonKey() final  WelcomeStatus status;
 final  List<RoadmapProgress> _roadmaps;
@override@JsonKey() List<RoadmapProgress> get roadmaps {
  if (_roadmaps is EqualUnmodifiableListView) return _roadmaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roadmaps);
}

@override final  String? selectedRoadmapId;
/// The start in progress, if any: both buttons wait for it.
@override final  StartChoice? starting;
/// Why the catalog failed to load, or why the last start failed.
/// [errorSerial] makes each failure distinct, so the same message twice
/// still shows twice.
@override final  String? errorMessage;
@override@JsonKey() final  int errorSerial;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WelcomeStateCopyWith<_WelcomeState> get copyWith => __$WelcomeStateCopyWithImpl<_WelcomeState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WelcomeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.roadmaps, _roadmaps)&&(identical(other.selectedRoadmapId, selectedRoadmapId) || other.selectedRoadmapId == selectedRoadmapId)&&(identical(other.starting, starting) || other.starting == starting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorSerial, errorSerial) || other.errorSerial == errorSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_roadmaps),selectedRoadmapId,starting,errorMessage,errorSerial);
}

@override
String toString() {
    return 'WelcomeState(status: $status, roadmaps: $roadmaps, selectedRoadmapId: $selectedRoadmapId, starting: $starting, errorMessage: $errorMessage, errorSerial: $errorSerial)';
}


}

/// @nodoc
abstract mixin class _$WelcomeStateCopyWith<$Res> implements $WelcomeStateCopyWith<$Res> {
  factory _$WelcomeStateCopyWith(_WelcomeState value, $Res Function(_WelcomeState) _then) = __$WelcomeStateCopyWithImpl;
@override @useResult
$Res call({
 WelcomeStatus status, List<RoadmapProgress> roadmaps, String? selectedRoadmapId, StartChoice? starting, String? errorMessage, int errorSerial
});




}
/// @nodoc
class __$WelcomeStateCopyWithImpl<$Res>
    implements _$WelcomeStateCopyWith<$Res> {
  __$WelcomeStateCopyWithImpl(this._self, this._then);

  final _WelcomeState _self;
  final $Res Function(_WelcomeState) _then;

/// Create a copy of WelcomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? roadmaps = null,Object? selectedRoadmapId = freezed,Object? starting = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(_WelcomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WelcomeStatus,roadmaps: null == roadmaps ? _self._roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>,selectedRoadmapId: freezed == selectedRoadmapId ? _self.selectedRoadmapId : selectedRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,starting: freezed == starting ? _self.starting : starting // ignore: cast_nullable_to_non_nullable
as StartChoice?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorSerial: null == errorSerial ? _self.errorSerial : errorSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
