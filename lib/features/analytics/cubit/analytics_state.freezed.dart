// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsState {

 AnalyticsStatus get status; LearningAnalytics? get analytics;
/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsStateCopyWith<AnalyticsState> get copyWith => _$AnalyticsStateCopyWithImpl<AnalyticsState>(this as AnalyticsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AnalyticsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.analytics, _this.analytics) || other.analytics == _this.analytics));
}


@override
int get hashCode {
  final _this = this as AnalyticsState;
  return Object.hash(runtimeType,_this.status,_this.analytics);
}

@override
String toString() {
  final _this = this as AnalyticsState;
  return 'AnalyticsState(status: ${_this.status}, analytics: ${_this.analytics})';
}


}

/// @nodoc
abstract mixin class $AnalyticsStateCopyWith<$Res>  {
  factory $AnalyticsStateCopyWith(AnalyticsState value, $Res Function(AnalyticsState) _then) = _$AnalyticsStateCopyWithImpl;
@useResult
$Res call({
 AnalyticsStatus status, LearningAnalytics? analytics
});


$LearningAnalyticsCopyWith<$Res>? get analytics;

}
/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._self, this._then);

  final AnalyticsState _self;
  final $Res Function(AnalyticsState) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? analytics = freezed,}) {
  return _then(AnalyticsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsStatus,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as LearningAnalytics?,
  ));
}
/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningAnalyticsCopyWith<$Res>? get analytics {
    if (_self.analytics == null) {
    return null;
  }

  return $LearningAnalyticsCopyWith<$Res>(_self.analytics!, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnalyticsState].
extension AnalyticsStatePatterns on AnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsState value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsState value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnalyticsStatus status,  LearningAnalytics? analytics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.status,_that.analytics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnalyticsStatus status,  LearningAnalytics? analytics)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState():
return $default(_that.status,_that.analytics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnalyticsStatus status,  LearningAnalytics? analytics)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsState() when $default != null:
return $default(_that.status,_that.analytics);case _:
  return null;

}
}

}

/// @nodoc


class _AnalyticsState implements AnalyticsState {
  const _AnalyticsState({this.status = AnalyticsStatus.loading, this.analytics});
  

@override@JsonKey() final  AnalyticsStatus status;
@override final  LearningAnalytics? analytics;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsStateCopyWith<_AnalyticsState> get copyWith => __$AnalyticsStateCopyWithImpl<_AnalyticsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsState&&(identical(other.status, status) || other.status == status)&&(identical(other.analytics, analytics) || other.analytics == analytics));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,analytics);
}

@override
String toString() {
    return 'AnalyticsState(status: $status, analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsStateCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory _$AnalyticsStateCopyWith(_AnalyticsState value, $Res Function(_AnalyticsState) _then) = __$AnalyticsStateCopyWithImpl;
@override @useResult
$Res call({
 AnalyticsStatus status, LearningAnalytics? analytics
});


@override $LearningAnalyticsCopyWith<$Res>? get analytics;

}
/// @nodoc
class __$AnalyticsStateCopyWithImpl<$Res>
    implements _$AnalyticsStateCopyWith<$Res> {
  __$AnalyticsStateCopyWithImpl(this._self, this._then);

  final _AnalyticsState _self;
  final $Res Function(_AnalyticsState) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? analytics = freezed,}) {
  return _then(_AnalyticsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AnalyticsStatus,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as LearningAnalytics?,
  ));
}

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningAnalyticsCopyWith<$Res>? get analytics {
    if (_self.analytics == null) {
    return null;
  }

  return $LearningAnalyticsCopyWith<$Res>(_self.analytics!, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}
}

// dart format on
