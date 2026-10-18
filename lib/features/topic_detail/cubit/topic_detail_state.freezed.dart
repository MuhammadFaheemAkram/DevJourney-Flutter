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

 CalendarDate get today; TopicDetailStatus get status; TopicDetails? get details;/// Why the last change failed; [errorSerial] makes each failure
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetailState&&(identical(other.today, _this.today) || other.today == _this.today)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.details, _this.details) || other.details == _this.details)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.errorSerial, _this.errorSerial) || other.errorSerial == _this.errorSerial));
}


@override
int get hashCode {
  final _this = this as TopicDetailState;
  return Object.hash(runtimeType,_this.today,_this.status,_this.details,_this.errorMessage,_this.errorSerial);
}

@override
String toString() {
  final _this = this as TopicDetailState;
  return 'TopicDetailState(today: ${_this.today}, status: ${_this.status}, details: ${_this.details}, errorMessage: ${_this.errorMessage}, errorSerial: ${_this.errorSerial})';
}


}

/// @nodoc
abstract mixin class $TopicDetailStateCopyWith<$Res>  {
  factory $TopicDetailStateCopyWith(TopicDetailState value, $Res Function(TopicDetailState) _then) = _$TopicDetailStateCopyWithImpl;
@useResult
$Res call({
 CalendarDate today, TopicDetailStatus status, TopicDetails? details, String? errorMessage, int errorSerial
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
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? status = null,Object? details = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(TopicDetailState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as TopicDetails?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarDate today,  TopicDetailStatus status,  TopicDetails? details,  String? errorMessage,  int errorSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.today,_that.status,_that.details,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarDate today,  TopicDetailStatus status,  TopicDetails? details,  String? errorMessage,  int errorSerial)  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState():
return $default(_that.today,_that.status,_that.details,_that.errorMessage,_that.errorSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarDate today,  TopicDetailStatus status,  TopicDetails? details,  String? errorMessage,  int errorSerial)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetailState() when $default != null:
return $default(_that.today,_that.status,_that.details,_that.errorMessage,_that.errorSerial);case _:
  return null;

}
}

}

/// @nodoc


class _TopicDetailState implements TopicDetailState {
  const _TopicDetailState({required this.today, this.status = TopicDetailStatus.loading, this.details, this.errorMessage, this.errorSerial = 0});
  

@override final  CalendarDate today;
@override@JsonKey() final  TopicDetailStatus status;
@override final  TopicDetails? details;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetailState&&(identical(other.today, today) || other.today == today)&&(identical(other.status, status) || other.status == status)&&(identical(other.details, details) || other.details == details)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorSerial, errorSerial) || other.errorSerial == errorSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,today,status,details,errorMessage,errorSerial);
}

@override
String toString() {
    return 'TopicDetailState(today: $today, status: $status, details: $details, errorMessage: $errorMessage, errorSerial: $errorSerial)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailStateCopyWith<$Res> implements $TopicDetailStateCopyWith<$Res> {
  factory _$TopicDetailStateCopyWith(_TopicDetailState value, $Res Function(_TopicDetailState) _then) = __$TopicDetailStateCopyWithImpl;
@override @useResult
$Res call({
 CalendarDate today, TopicDetailStatus status, TopicDetails? details, String? errorMessage, int errorSerial
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
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? status = null,Object? details = freezed,Object? errorMessage = freezed,Object? errorSerial = null,}) {
  return _then(_TopicDetailState(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TopicDetailStatus,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as TopicDetails?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
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
