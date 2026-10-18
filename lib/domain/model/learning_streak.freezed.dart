// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_streak.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearningStreak {

/// The run of active days ending today, or yesterday if today has no
/// activity yet: a streak isn't broken until the day is over.
 int get current;/// The longest run ever.
 int get longest;/// Whether today already counts.
 bool get todayCounts;
/// Create a copy of LearningStreak
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningStreakCopyWith<LearningStreak> get copyWith => _$LearningStreakCopyWithImpl<LearningStreak>(this as LearningStreak, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LearningStreak;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningStreak&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.longest, _this.longest) || other.longest == _this.longest)&&(identical(other.todayCounts, _this.todayCounts) || other.todayCounts == _this.todayCounts));
}


@override
int get hashCode {
  final _this = this as LearningStreak;
  return Object.hash(runtimeType,_this.current,_this.longest,_this.todayCounts);
}

@override
String toString() {
  final _this = this as LearningStreak;
  return 'LearningStreak(current: ${_this.current}, longest: ${_this.longest}, todayCounts: ${_this.todayCounts})';
}


}

/// @nodoc
abstract mixin class $LearningStreakCopyWith<$Res>  {
  factory $LearningStreakCopyWith(LearningStreak value, $Res Function(LearningStreak) _then) = _$LearningStreakCopyWithImpl;
@useResult
$Res call({
 int current, int longest, bool todayCounts
});




}
/// @nodoc
class _$LearningStreakCopyWithImpl<$Res>
    implements $LearningStreakCopyWith<$Res> {
  _$LearningStreakCopyWithImpl(this._self, this._then);

  final LearningStreak _self;
  final $Res Function(LearningStreak) _then;

/// Create a copy of LearningStreak
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? longest = null,Object? todayCounts = null,}) {
  return _then(LearningStreak(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,longest: null == longest ? _self.longest : longest // ignore: cast_nullable_to_non_nullable
as int,todayCounts: null == todayCounts ? _self.todayCounts : todayCounts // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningStreak].
extension LearningStreakPatterns on LearningStreak {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningStreak value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningStreak() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningStreak value)  $default,){
final _that = this;
switch (_that) {
case _LearningStreak():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningStreak value)?  $default,){
final _that = this;
switch (_that) {
case _LearningStreak() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current,  int longest,  bool todayCounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningStreak() when $default != null:
return $default(_that.current,_that.longest,_that.todayCounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current,  int longest,  bool todayCounts)  $default,) {final _that = this;
switch (_that) {
case _LearningStreak():
return $default(_that.current,_that.longest,_that.todayCounts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current,  int longest,  bool todayCounts)?  $default,) {final _that = this;
switch (_that) {
case _LearningStreak() when $default != null:
return $default(_that.current,_that.longest,_that.todayCounts);case _:
  return null;

}
}

}

/// @nodoc


class _LearningStreak implements LearningStreak {
  const _LearningStreak({this.current = 0, this.longest = 0, this.todayCounts = false});
  

/// The run of active days ending today, or yesterday if today has no
/// activity yet: a streak isn't broken until the day is over.
@override@JsonKey() final  int current;
/// The longest run ever.
@override@JsonKey() final  int longest;
/// Whether today already counts.
@override@JsonKey() final  bool todayCounts;

/// Create a copy of LearningStreak
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningStreakCopyWith<_LearningStreak> get copyWith => __$LearningStreakCopyWithImpl<_LearningStreak>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningStreak&&(identical(other.current, current) || other.current == current)&&(identical(other.longest, longest) || other.longest == longest)&&(identical(other.todayCounts, todayCounts) || other.todayCounts == todayCounts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,current,longest,todayCounts);
}

@override
String toString() {
    return 'LearningStreak(current: $current, longest: $longest, todayCounts: $todayCounts)';
}


}

/// @nodoc
abstract mixin class _$LearningStreakCopyWith<$Res> implements $LearningStreakCopyWith<$Res> {
  factory _$LearningStreakCopyWith(_LearningStreak value, $Res Function(_LearningStreak) _then) = __$LearningStreakCopyWithImpl;
@override @useResult
$Res call({
 int current, int longest, bool todayCounts
});




}
/// @nodoc
class __$LearningStreakCopyWithImpl<$Res>
    implements _$LearningStreakCopyWith<$Res> {
  __$LearningStreakCopyWithImpl(this._self, this._then);

  final _LearningStreak _self;
  final $Res Function(_LearningStreak) _then;

/// Create a copy of LearningStreak
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? longest = null,Object? todayCounts = null,}) {
  return _then(_LearningStreak(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,longest: null == longest ? _self.longest : longest // ignore: cast_nullable_to_non_nullable
as int,todayCounts: null == todayCounts ? _self.todayCounts : todayCounts // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
