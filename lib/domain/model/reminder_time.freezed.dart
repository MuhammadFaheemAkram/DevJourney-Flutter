// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReminderTime {

 int get hour; int get minute;
/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<ReminderTime> get copyWith => _$ReminderTimeCopyWithImpl<ReminderTime>(this as ReminderTime, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReminderTime;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTime&&(identical(other.hour, _this.hour) || other.hour == _this.hour)&&(identical(other.minute, _this.minute) || other.minute == _this.minute));
}


@override
int get hashCode {
  final _this = this as ReminderTime;
  return Object.hash(runtimeType,_this.hour,_this.minute);
}

@override
String toString() {
  final _this = this as ReminderTime;
  return 'ReminderTime(hour: ${_this.hour}, minute: ${_this.minute})';
}


}

/// @nodoc
abstract mixin class $ReminderTimeCopyWith<$Res>  {
  factory $ReminderTimeCopyWith(ReminderTime value, $Res Function(ReminderTime) _then) = _$ReminderTimeCopyWithImpl;
@useResult
$Res call({
 int hour, int minute
});




}
/// @nodoc
class _$ReminderTimeCopyWithImpl<$Res>
    implements $ReminderTimeCopyWith<$Res> {
  _$ReminderTimeCopyWithImpl(this._self, this._then);

  final ReminderTime _self;
  final $Res Function(ReminderTime) _then;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hour = null,Object? minute = null,}) {
  return _then(ReminderTime(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTime].
extension ReminderTimePatterns on ReminderTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTime value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTime value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hour,  int minute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
return $default(_that.hour,_that.minute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hour,  int minute)  $default,) {final _that = this;
switch (_that) {
case _ReminderTime():
return $default(_that.hour,_that.minute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hour,  int minute)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTime() when $default != null:
return $default(_that.hour,_that.minute);case _:
  return null;

}
}

}

/// @nodoc


class _ReminderTime extends ReminderTime {
  const _ReminderTime({required this.hour, required this.minute}): assert(hour >= 0 && hour < 24, 'hour is 0–23'),assert(minute >= 0 && minute < 60, 'minute is 0–59'),super._();
  

@override final  int hour;
@override final  int minute;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTimeCopyWith<_ReminderTime> get copyWith => __$ReminderTimeCopyWithImpl<_ReminderTime>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTime&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hour,minute);
}

@override
String toString() {
    return 'ReminderTime(hour: $hour, minute: $minute)';
}


}

/// @nodoc
abstract mixin class _$ReminderTimeCopyWith<$Res> implements $ReminderTimeCopyWith<$Res> {
  factory _$ReminderTimeCopyWith(_ReminderTime value, $Res Function(_ReminderTime) _then) = __$ReminderTimeCopyWithImpl;
@override @useResult
$Res call({
 int hour, int minute
});




}
/// @nodoc
class __$ReminderTimeCopyWithImpl<$Res>
    implements _$ReminderTimeCopyWith<$Res> {
  __$ReminderTimeCopyWithImpl(this._self, this._then);

  final _ReminderTime _self;
  final $Res Function(_ReminderTime) _then;

/// Create a copy of ReminderTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hour = null,Object? minute = null,}) {
  return _then(_ReminderTime(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
