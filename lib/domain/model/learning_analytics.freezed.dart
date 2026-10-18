// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeriodCount {

 CalendarDate get start; CalendarDate get end; int get count;
/// Create a copy of PeriodCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodCountCopyWith<PeriodCount> get copyWith => _$PeriodCountCopyWithImpl<PeriodCount>(this as PeriodCount, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PeriodCount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodCount&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&(identical(other.count, _this.count) || other.count == _this.count));
}


@override
int get hashCode {
  final _this = this as PeriodCount;
  return Object.hash(runtimeType,_this.start,_this.end,_this.count);
}

@override
String toString() {
  final _this = this as PeriodCount;
  return 'PeriodCount(start: ${_this.start}, end: ${_this.end}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $PeriodCountCopyWith<$Res>  {
  factory $PeriodCountCopyWith(PeriodCount value, $Res Function(PeriodCount) _then) = _$PeriodCountCopyWithImpl;
@useResult
$Res call({
 CalendarDate start, CalendarDate end, int count
});




}
/// @nodoc
class _$PeriodCountCopyWithImpl<$Res>
    implements $PeriodCountCopyWith<$Res> {
  _$PeriodCountCopyWithImpl(this._self, this._then);

  final PeriodCount _self;
  final $Res Function(PeriodCount) _then;

/// Create a copy of PeriodCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,Object? count = null,}) {
  return _then(PeriodCount(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as CalendarDate,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as CalendarDate,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodCount].
extension PeriodCountPatterns on PeriodCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodCount value)  $default,){
final _that = this;
switch (_that) {
case _PeriodCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodCount value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarDate start,  CalendarDate end,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodCount() when $default != null:
return $default(_that.start,_that.end,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarDate start,  CalendarDate end,  int count)  $default,) {final _that = this;
switch (_that) {
case _PeriodCount():
return $default(_that.start,_that.end,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarDate start,  CalendarDate end,  int count)?  $default,) {final _that = this;
switch (_that) {
case _PeriodCount() when $default != null:
return $default(_that.start,_that.end,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _PeriodCount implements PeriodCount {
  const _PeriodCount({required this.start, required this.end, required this.count});
  

@override final  CalendarDate start;
@override final  CalendarDate end;
@override final  int count;

/// Create a copy of PeriodCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodCountCopyWith<_PeriodCount> get copyWith => __$PeriodCountCopyWithImpl<_PeriodCount>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodCount&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode {
    return Object.hash(runtimeType,start,end,count);
}

@override
String toString() {
    return 'PeriodCount(start: $start, end: $end, count: $count)';
}


}

/// @nodoc
abstract mixin class _$PeriodCountCopyWith<$Res> implements $PeriodCountCopyWith<$Res> {
  factory _$PeriodCountCopyWith(_PeriodCount value, $Res Function(_PeriodCount) _then) = __$PeriodCountCopyWithImpl;
@override @useResult
$Res call({
 CalendarDate start, CalendarDate end, int count
});




}
/// @nodoc
class __$PeriodCountCopyWithImpl<$Res>
    implements _$PeriodCountCopyWith<$Res> {
  __$PeriodCountCopyWithImpl(this._self, this._then);

  final _PeriodCount _self;
  final $Res Function(_PeriodCount) _then;

/// Create a copy of PeriodCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,Object? count = null,}) {
  return _then(_PeriodCount(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as CalendarDate,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as CalendarDate,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$GoalCompletion {

 int get met; int get total;
/// Create a copy of GoalCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCompletionCopyWith<GoalCompletion> get copyWith => _$GoalCompletionCopyWithImpl<GoalCompletion>(this as GoalCompletion, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GoalCompletion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalCompletion&&(identical(other.met, _this.met) || other.met == _this.met)&&(identical(other.total, _this.total) || other.total == _this.total));
}


@override
int get hashCode {
  final _this = this as GoalCompletion;
  return Object.hash(runtimeType,_this.met,_this.total);
}

@override
String toString() {
  final _this = this as GoalCompletion;
  return 'GoalCompletion(met: ${_this.met}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $GoalCompletionCopyWith<$Res>  {
  factory $GoalCompletionCopyWith(GoalCompletion value, $Res Function(GoalCompletion) _then) = _$GoalCompletionCopyWithImpl;
@useResult
$Res call({
 int met, int total
});




}
/// @nodoc
class _$GoalCompletionCopyWithImpl<$Res>
    implements $GoalCompletionCopyWith<$Res> {
  _$GoalCompletionCopyWithImpl(this._self, this._then);

  final GoalCompletion _self;
  final $Res Function(GoalCompletion) _then;

/// Create a copy of GoalCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? met = null,Object? total = null,}) {
  return _then(GoalCompletion(
met: null == met ? _self.met : met // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalCompletion].
extension GoalCompletionPatterns on GoalCompletion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalCompletion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalCompletion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalCompletion value)  $default,){
final _that = this;
switch (_that) {
case _GoalCompletion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalCompletion value)?  $default,){
final _that = this;
switch (_that) {
case _GoalCompletion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int met,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalCompletion() when $default != null:
return $default(_that.met,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int met,  int total)  $default,) {final _that = this;
switch (_that) {
case _GoalCompletion():
return $default(_that.met,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int met,  int total)?  $default,) {final _that = this;
switch (_that) {
case _GoalCompletion() when $default != null:
return $default(_that.met,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _GoalCompletion extends GoalCompletion {
  const _GoalCompletion({required this.met, required this.total}): super._();
  

@override final  int met;
@override final  int total;

/// Create a copy of GoalCompletion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCompletionCopyWith<_GoalCompletion> get copyWith => __$GoalCompletionCopyWithImpl<_GoalCompletion>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalCompletion&&(identical(other.met, met) || other.met == met)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode {
    return Object.hash(runtimeType,met,total);
}

@override
String toString() {
    return 'GoalCompletion(met: $met, total: $total)';
}


}

/// @nodoc
abstract mixin class _$GoalCompletionCopyWith<$Res> implements $GoalCompletionCopyWith<$Res> {
  factory _$GoalCompletionCopyWith(_GoalCompletion value, $Res Function(_GoalCompletion) _then) = __$GoalCompletionCopyWithImpl;
@override @useResult
$Res call({
 int met, int total
});




}
/// @nodoc
class __$GoalCompletionCopyWithImpl<$Res>
    implements _$GoalCompletionCopyWith<$Res> {
  __$GoalCompletionCopyWithImpl(this._self, this._then);

  final _GoalCompletion _self;
  final $Res Function(_GoalCompletion) _then;

/// Create a copy of GoalCompletion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? met = null,Object? total = null,}) {
  return _then(_GoalCompletion(
met: null == met ? _self.met : met // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$LearningAnalytics {

 CalendarDate get today; LearningStreak get streak; int get topicsCompleted; int get totalTopics; int get challengesCompleted; GoalCompletion get goals;/// Topics completed per ISO week, oldest first, this week last.
 List<PeriodCount> get weekly;/// Topics completed per calendar month, oldest first.
 List<PeriodCount> get monthly; List<RoadmapProgress> get roadmaps;/// Completions and check-ins per day, for the heatmap; days without any
/// are absent.
 Map<CalendarDate, int> get activity;/// The heatmap's first day: a Monday, [heatmapWeeks] weeks back.
 CalendarDate get heatmapStart;
/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningAnalyticsCopyWith<LearningAnalytics> get copyWith => _$LearningAnalyticsCopyWithImpl<LearningAnalytics>(this as LearningAnalytics, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LearningAnalytics;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningAnalytics&&(identical(other.today, _this.today) || other.today == _this.today)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.topicsCompleted, _this.topicsCompleted) || other.topicsCompleted == _this.topicsCompleted)&&(identical(other.totalTopics, _this.totalTopics) || other.totalTopics == _this.totalTopics)&&(identical(other.challengesCompleted, _this.challengesCompleted) || other.challengesCompleted == _this.challengesCompleted)&&(identical(other.goals, _this.goals) || other.goals == _this.goals)&&const DeepCollectionEquality().equals(other.weekly, _this.weekly)&&const DeepCollectionEquality().equals(other.monthly, _this.monthly)&&const DeepCollectionEquality().equals(other.roadmaps, _this.roadmaps)&&const DeepCollectionEquality().equals(other.activity, _this.activity)&&(identical(other.heatmapStart, _this.heatmapStart) || other.heatmapStart == _this.heatmapStart));
}


@override
int get hashCode {
  final _this = this as LearningAnalytics;
  return Object.hash(runtimeType,_this.today,_this.streak,_this.topicsCompleted,_this.totalTopics,_this.challengesCompleted,_this.goals,const DeepCollectionEquality().hash(_this.weekly),const DeepCollectionEquality().hash(_this.monthly),const DeepCollectionEquality().hash(_this.roadmaps),const DeepCollectionEquality().hash(_this.activity),_this.heatmapStart);
}

@override
String toString() {
  final _this = this as LearningAnalytics;
  return 'LearningAnalytics(today: ${_this.today}, streak: ${_this.streak}, topicsCompleted: ${_this.topicsCompleted}, totalTopics: ${_this.totalTopics}, challengesCompleted: ${_this.challengesCompleted}, goals: ${_this.goals}, weekly: ${_this.weekly}, monthly: ${_this.monthly}, roadmaps: ${_this.roadmaps}, activity: ${_this.activity}, heatmapStart: ${_this.heatmapStart})';
}


}

/// @nodoc
abstract mixin class $LearningAnalyticsCopyWith<$Res>  {
  factory $LearningAnalyticsCopyWith(LearningAnalytics value, $Res Function(LearningAnalytics) _then) = _$LearningAnalyticsCopyWithImpl;
@useResult
$Res call({
 CalendarDate today, LearningStreak streak, int topicsCompleted, int totalTopics, int challengesCompleted, GoalCompletion goals, List<PeriodCount> weekly, List<PeriodCount> monthly, List<RoadmapProgress> roadmaps, Map<CalendarDate, int> activity, CalendarDate heatmapStart
});


$LearningStreakCopyWith<$Res> get streak;$GoalCompletionCopyWith<$Res> get goals;

}
/// @nodoc
class _$LearningAnalyticsCopyWithImpl<$Res>
    implements $LearningAnalyticsCopyWith<$Res> {
  _$LearningAnalyticsCopyWithImpl(this._self, this._then);

  final LearningAnalytics _self;
  final $Res Function(LearningAnalytics) _then;

/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? today = null,Object? streak = null,Object? topicsCompleted = null,Object? totalTopics = null,Object? challengesCompleted = null,Object? goals = null,Object? weekly = null,Object? monthly = null,Object? roadmaps = null,Object? activity = null,Object? heatmapStart = null,}) {
  return _then(LearningAnalytics(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as LearningStreak,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalTopics: null == totalTopics ? _self.totalTopics : totalTopics // ignore: cast_nullable_to_non_nullable
as int,challengesCompleted: null == challengesCompleted ? _self.challengesCompleted : challengesCompleted // ignore: cast_nullable_to_non_nullable
as int,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as GoalCompletion,weekly: null == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as List<PeriodCount>,monthly: null == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as List<PeriodCount>,roadmaps: null == roadmaps ? _self.roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as Map<CalendarDate, int>,heatmapStart: null == heatmapStart ? _self.heatmapStart : heatmapStart // ignore: cast_nullable_to_non_nullable
as CalendarDate,
  ));
}
/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningStreakCopyWith<$Res> get streak {
  
  return $LearningStreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCompletionCopyWith<$Res> get goals {
  
  return $GoalCompletionCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}
}


/// Adds pattern-matching-related methods to [LearningAnalytics].
extension LearningAnalyticsPatterns on LearningAnalytics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningAnalytics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningAnalytics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningAnalytics value)  $default,){
final _that = this;
switch (_that) {
case _LearningAnalytics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningAnalytics value)?  $default,){
final _that = this;
switch (_that) {
case _LearningAnalytics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalendarDate today,  LearningStreak streak,  int topicsCompleted,  int totalTopics,  int challengesCompleted,  GoalCompletion goals,  List<PeriodCount> weekly,  List<PeriodCount> monthly,  List<RoadmapProgress> roadmaps,  Map<CalendarDate, int> activity,  CalendarDate heatmapStart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningAnalytics() when $default != null:
return $default(_that.today,_that.streak,_that.topicsCompleted,_that.totalTopics,_that.challengesCompleted,_that.goals,_that.weekly,_that.monthly,_that.roadmaps,_that.activity,_that.heatmapStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalendarDate today,  LearningStreak streak,  int topicsCompleted,  int totalTopics,  int challengesCompleted,  GoalCompletion goals,  List<PeriodCount> weekly,  List<PeriodCount> monthly,  List<RoadmapProgress> roadmaps,  Map<CalendarDate, int> activity,  CalendarDate heatmapStart)  $default,) {final _that = this;
switch (_that) {
case _LearningAnalytics():
return $default(_that.today,_that.streak,_that.topicsCompleted,_that.totalTopics,_that.challengesCompleted,_that.goals,_that.weekly,_that.monthly,_that.roadmaps,_that.activity,_that.heatmapStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalendarDate today,  LearningStreak streak,  int topicsCompleted,  int totalTopics,  int challengesCompleted,  GoalCompletion goals,  List<PeriodCount> weekly,  List<PeriodCount> monthly,  List<RoadmapProgress> roadmaps,  Map<CalendarDate, int> activity,  CalendarDate heatmapStart)?  $default,) {final _that = this;
switch (_that) {
case _LearningAnalytics() when $default != null:
return $default(_that.today,_that.streak,_that.topicsCompleted,_that.totalTopics,_that.challengesCompleted,_that.goals,_that.weekly,_that.monthly,_that.roadmaps,_that.activity,_that.heatmapStart);case _:
  return null;

}
}

}

/// @nodoc


class _LearningAnalytics extends LearningAnalytics {
  const _LearningAnalytics({required this.today, required this.streak, required this.topicsCompleted, required this.totalTopics, required this.challengesCompleted, required this.goals, required  List<PeriodCount> weekly, required  List<PeriodCount> monthly, required  List<RoadmapProgress> roadmaps, required  Map<CalendarDate, int> activity, required this.heatmapStart}): _weekly = weekly,_monthly = monthly,_roadmaps = roadmaps,_activity = activity,super._();
  

@override final  CalendarDate today;
@override final  LearningStreak streak;
@override final  int topicsCompleted;
@override final  int totalTopics;
@override final  int challengesCompleted;
@override final  GoalCompletion goals;
/// Topics completed per ISO week, oldest first, this week last.
 final  List<PeriodCount> _weekly;
/// Topics completed per ISO week, oldest first, this week last.
@override List<PeriodCount> get weekly {
  if (_weekly is EqualUnmodifiableListView) return _weekly;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekly);
}

/// Topics completed per calendar month, oldest first.
 final  List<PeriodCount> _monthly;
/// Topics completed per calendar month, oldest first.
@override List<PeriodCount> get monthly {
  if (_monthly is EqualUnmodifiableListView) return _monthly;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monthly);
}

 final  List<RoadmapProgress> _roadmaps;
@override List<RoadmapProgress> get roadmaps {
  if (_roadmaps is EqualUnmodifiableListView) return _roadmaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roadmaps);
}

/// Completions and check-ins per day, for the heatmap; days without any
/// are absent.
 final  Map<CalendarDate, int> _activity;
/// Completions and check-ins per day, for the heatmap; days without any
/// are absent.
@override Map<CalendarDate, int> get activity {
  if (_activity is EqualUnmodifiableMapView) return _activity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_activity);
}

/// The heatmap's first day: a Monday, [heatmapWeeks] weeks back.
@override final  CalendarDate heatmapStart;

/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningAnalyticsCopyWith<_LearningAnalytics> get copyWith => __$LearningAnalyticsCopyWithImpl<_LearningAnalytics>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningAnalytics&&(identical(other.today, today) || other.today == today)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.topicsCompleted, topicsCompleted) || other.topicsCompleted == topicsCompleted)&&(identical(other.totalTopics, totalTopics) || other.totalTopics == totalTopics)&&(identical(other.challengesCompleted, challengesCompleted) || other.challengesCompleted == challengesCompleted)&&(identical(other.goals, goals) || other.goals == goals)&&const DeepCollectionEquality().equals(other.weekly, _weekly)&&const DeepCollectionEquality().equals(other.monthly, _monthly)&&const DeepCollectionEquality().equals(other.roadmaps, _roadmaps)&&const DeepCollectionEquality().equals(other.activity, _activity)&&(identical(other.heatmapStart, heatmapStart) || other.heatmapStart == heatmapStart));
}


@override
int get hashCode {
    return Object.hash(runtimeType,today,streak,topicsCompleted,totalTopics,challengesCompleted,goals,const DeepCollectionEquality().hash(_weekly),const DeepCollectionEquality().hash(_monthly),const DeepCollectionEquality().hash(_roadmaps),const DeepCollectionEquality().hash(_activity),heatmapStart);
}

@override
String toString() {
    return 'LearningAnalytics(today: $today, streak: $streak, topicsCompleted: $topicsCompleted, totalTopics: $totalTopics, challengesCompleted: $challengesCompleted, goals: $goals, weekly: $weekly, monthly: $monthly, roadmaps: $roadmaps, activity: $activity, heatmapStart: $heatmapStart)';
}


}

/// @nodoc
abstract mixin class _$LearningAnalyticsCopyWith<$Res> implements $LearningAnalyticsCopyWith<$Res> {
  factory _$LearningAnalyticsCopyWith(_LearningAnalytics value, $Res Function(_LearningAnalytics) _then) = __$LearningAnalyticsCopyWithImpl;
@override @useResult
$Res call({
 CalendarDate today, LearningStreak streak, int topicsCompleted, int totalTopics, int challengesCompleted, GoalCompletion goals, List<PeriodCount> weekly, List<PeriodCount> monthly, List<RoadmapProgress> roadmaps, Map<CalendarDate, int> activity, CalendarDate heatmapStart
});


@override $LearningStreakCopyWith<$Res> get streak;@override $GoalCompletionCopyWith<$Res> get goals;

}
/// @nodoc
class __$LearningAnalyticsCopyWithImpl<$Res>
    implements _$LearningAnalyticsCopyWith<$Res> {
  __$LearningAnalyticsCopyWithImpl(this._self, this._then);

  final _LearningAnalytics _self;
  final $Res Function(_LearningAnalytics) _then;

/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? today = null,Object? streak = null,Object? topicsCompleted = null,Object? totalTopics = null,Object? challengesCompleted = null,Object? goals = null,Object? weekly = null,Object? monthly = null,Object? roadmaps = null,Object? activity = null,Object? heatmapStart = null,}) {
  return _then(_LearningAnalytics(
today: null == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as CalendarDate,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as LearningStreak,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalTopics: null == totalTopics ? _self.totalTopics : totalTopics // ignore: cast_nullable_to_non_nullable
as int,challengesCompleted: null == challengesCompleted ? _self.challengesCompleted : challengesCompleted // ignore: cast_nullable_to_non_nullable
as int,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as GoalCompletion,weekly: null == weekly ? _self._weekly : weekly // ignore: cast_nullable_to_non_nullable
as List<PeriodCount>,monthly: null == monthly ? _self._monthly : monthly // ignore: cast_nullable_to_non_nullable
as List<PeriodCount>,roadmaps: null == roadmaps ? _self._roadmaps : roadmaps // ignore: cast_nullable_to_non_nullable
as List<RoadmapProgress>,activity: null == activity ? _self._activity : activity // ignore: cast_nullable_to_non_nullable
as Map<CalendarDate, int>,heatmapStart: null == heatmapStart ? _self.heatmapStart : heatmapStart // ignore: cast_nullable_to_non_nullable
as CalendarDate,
  ));
}

/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningStreakCopyWith<$Res> get streak {
  
  return $LearningStreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of LearningAnalytics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoalCompletionCopyWith<$Res> get goals {
  
  return $GoalCompletionCopyWith<$Res>(_self.goals, (value) {
    return _then(_self.copyWith(goals: value));
  });
}
}

// dart format on
