// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardSummary {

/// When it was derived: "today" for the goals, "5 min ago" for notes.
 DateTime get now; LearningStreak get streak;/// The active roadmap's path; `null` if none is set (or it's gone).
 RoadmapPath? get activeRoadmap;/// What to learn next in the active roadmap; `null` when it's done.
 TopicItem? get nextTopic; int get topicsCompleted; int get challengesCompleted;/// The goals with their current progress: daily first, then weekly,
/// then monthly.
 List<GoalProgress> get goals;/// The latest edited notes (three at most).
 List<NoteItem> get recentNotes;
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryCopyWith<DashboardSummary> get copyWith => _$DashboardSummaryCopyWithImpl<DashboardSummary>(this as DashboardSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DashboardSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummary&&(identical(other.now, _this.now) || other.now == _this.now)&&(identical(other.streak, _this.streak) || other.streak == _this.streak)&&(identical(other.activeRoadmap, _this.activeRoadmap) || other.activeRoadmap == _this.activeRoadmap)&&(identical(other.nextTopic, _this.nextTopic) || other.nextTopic == _this.nextTopic)&&(identical(other.topicsCompleted, _this.topicsCompleted) || other.topicsCompleted == _this.topicsCompleted)&&(identical(other.challengesCompleted, _this.challengesCompleted) || other.challengesCompleted == _this.challengesCompleted)&&const DeepCollectionEquality().equals(other.goals, _this.goals)&&const DeepCollectionEquality().equals(other.recentNotes, _this.recentNotes));
}


@override
int get hashCode {
  final _this = this as DashboardSummary;
  return Object.hash(runtimeType,_this.now,_this.streak,_this.activeRoadmap,_this.nextTopic,_this.topicsCompleted,_this.challengesCompleted,const DeepCollectionEquality().hash(_this.goals),const DeepCollectionEquality().hash(_this.recentNotes));
}

@override
String toString() {
  final _this = this as DashboardSummary;
  return 'DashboardSummary(now: ${_this.now}, streak: ${_this.streak}, activeRoadmap: ${_this.activeRoadmap}, nextTopic: ${_this.nextTopic}, topicsCompleted: ${_this.topicsCompleted}, challengesCompleted: ${_this.challengesCompleted}, goals: ${_this.goals}, recentNotes: ${_this.recentNotes})';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res>  {
  factory $DashboardSummaryCopyWith(DashboardSummary value, $Res Function(DashboardSummary) _then) = _$DashboardSummaryCopyWithImpl;
@useResult
$Res call({
 DateTime now, LearningStreak streak, RoadmapPath? activeRoadmap, TopicItem? nextTopic, int topicsCompleted, int challengesCompleted, List<GoalProgress> goals, List<NoteItem> recentNotes
});


$LearningStreakCopyWith<$Res> get streak;$RoadmapPathCopyWith<$Res>? get activeRoadmap;$TopicItemCopyWith<$Res>? get nextTopic;

}
/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? now = null,Object? streak = null,Object? activeRoadmap = freezed,Object? nextTopic = freezed,Object? topicsCompleted = null,Object? challengesCompleted = null,Object? goals = null,Object? recentNotes = null,}) {
  return _then(DashboardSummary(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as LearningStreak,activeRoadmap: freezed == activeRoadmap ? _self.activeRoadmap : activeRoadmap // ignore: cast_nullable_to_non_nullable
as RoadmapPath?,nextTopic: freezed == nextTopic ? _self.nextTopic : nextTopic // ignore: cast_nullable_to_non_nullable
as TopicItem?,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,challengesCompleted: null == challengesCompleted ? _self.challengesCompleted : challengesCompleted // ignore: cast_nullable_to_non_nullable
as int,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,recentNotes: null == recentNotes ? _self.recentNotes : recentNotes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,
  ));
}
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningStreakCopyWith<$Res> get streak {
  
  return $LearningStreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapPathCopyWith<$Res>? get activeRoadmap {
    if (_self.activeRoadmap == null) {
    return null;
  }

  return $RoadmapPathCopyWith<$Res>(_self.activeRoadmap!, (value) {
    return _then(_self.copyWith(activeRoadmap: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicItemCopyWith<$Res>? get nextTopic {
    if (_self.nextTopic == null) {
    return null;
  }

  return $TopicItemCopyWith<$Res>(_self.nextTopic!, (value) {
    return _then(_self.copyWith(nextTopic: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummary value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime now,  LearningStreak streak,  RoadmapPath? activeRoadmap,  TopicItem? nextTopic,  int topicsCompleted,  int challengesCompleted,  List<GoalProgress> goals,  List<NoteItem> recentNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.now,_that.streak,_that.activeRoadmap,_that.nextTopic,_that.topicsCompleted,_that.challengesCompleted,_that.goals,_that.recentNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime now,  LearningStreak streak,  RoadmapPath? activeRoadmap,  TopicItem? nextTopic,  int topicsCompleted,  int challengesCompleted,  List<GoalProgress> goals,  List<NoteItem> recentNotes)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary():
return $default(_that.now,_that.streak,_that.activeRoadmap,_that.nextTopic,_that.topicsCompleted,_that.challengesCompleted,_that.goals,_that.recentNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime now,  LearningStreak streak,  RoadmapPath? activeRoadmap,  TopicItem? nextTopic,  int topicsCompleted,  int challengesCompleted,  List<GoalProgress> goals,  List<NoteItem> recentNotes)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.now,_that.streak,_that.activeRoadmap,_that.nextTopic,_that.topicsCompleted,_that.challengesCompleted,_that.goals,_that.recentNotes);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardSummary extends DashboardSummary {
  const _DashboardSummary({required this.now, required this.streak, this.activeRoadmap, this.nextTopic, required this.topicsCompleted, required this.challengesCompleted,  List<GoalProgress> goals = const <GoalProgress>[],  List<NoteItem> recentNotes = const <NoteItem>[]}): _goals = goals,_recentNotes = recentNotes,super._();
  

/// When it was derived: "today" for the goals, "5 min ago" for notes.
@override final  DateTime now;
@override final  LearningStreak streak;
/// The active roadmap's path; `null` if none is set (or it's gone).
@override final  RoadmapPath? activeRoadmap;
/// What to learn next in the active roadmap; `null` when it's done.
@override final  TopicItem? nextTopic;
@override final  int topicsCompleted;
@override final  int challengesCompleted;
/// The goals with their current progress: daily first, then weekly,
/// then monthly.
 final  List<GoalProgress> _goals;
/// The goals with their current progress: daily first, then weekly,
/// then monthly.
@override@JsonKey() List<GoalProgress> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

/// The latest edited notes (three at most).
 final  List<NoteItem> _recentNotes;
/// The latest edited notes (three at most).
@override@JsonKey() List<NoteItem> get recentNotes {
  if (_recentNotes is EqualUnmodifiableListView) return _recentNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentNotes);
}


/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryCopyWith<_DashboardSummary> get copyWith => __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummary&&(identical(other.now, now) || other.now == now)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.activeRoadmap, activeRoadmap) || other.activeRoadmap == activeRoadmap)&&(identical(other.nextTopic, nextTopic) || other.nextTopic == nextTopic)&&(identical(other.topicsCompleted, topicsCompleted) || other.topicsCompleted == topicsCompleted)&&(identical(other.challengesCompleted, challengesCompleted) || other.challengesCompleted == challengesCompleted)&&const DeepCollectionEquality().equals(other.goals, _goals)&&const DeepCollectionEquality().equals(other.recentNotes, _recentNotes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,now,streak,activeRoadmap,nextTopic,topicsCompleted,challengesCompleted,const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_recentNotes));
}

@override
String toString() {
    return 'DashboardSummary(now: $now, streak: $streak, activeRoadmap: $activeRoadmap, nextTopic: $nextTopic, topicsCompleted: $topicsCompleted, challengesCompleted: $challengesCompleted, goals: $goals, recentNotes: $recentNotes)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res> implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(_DashboardSummary value, $Res Function(_DashboardSummary) _then) = __$DashboardSummaryCopyWithImpl;
@override @useResult
$Res call({
 DateTime now, LearningStreak streak, RoadmapPath? activeRoadmap, TopicItem? nextTopic, int topicsCompleted, int challengesCompleted, List<GoalProgress> goals, List<NoteItem> recentNotes
});


@override $LearningStreakCopyWith<$Res> get streak;@override $RoadmapPathCopyWith<$Res>? get activeRoadmap;@override $TopicItemCopyWith<$Res>? get nextTopic;

}
/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? now = null,Object? streak = null,Object? activeRoadmap = freezed,Object? nextTopic = freezed,Object? topicsCompleted = null,Object? challengesCompleted = null,Object? goals = null,Object? recentNotes = null,}) {
  return _then(_DashboardSummary(
now: null == now ? _self.now : now // ignore: cast_nullable_to_non_nullable
as DateTime,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as LearningStreak,activeRoadmap: freezed == activeRoadmap ? _self.activeRoadmap : activeRoadmap // ignore: cast_nullable_to_non_nullable
as RoadmapPath?,nextTopic: freezed == nextTopic ? _self.nextTopic : nextTopic // ignore: cast_nullable_to_non_nullable
as TopicItem?,topicsCompleted: null == topicsCompleted ? _self.topicsCompleted : topicsCompleted // ignore: cast_nullable_to_non_nullable
as int,challengesCompleted: null == challengesCompleted ? _self.challengesCompleted : challengesCompleted // ignore: cast_nullable_to_non_nullable
as int,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,recentNotes: null == recentNotes ? _self._recentNotes : recentNotes // ignore: cast_nullable_to_non_nullable
as List<NoteItem>,
  ));
}

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearningStreakCopyWith<$Res> get streak {
  
  return $LearningStreakCopyWith<$Res>(_self.streak, (value) {
    return _then(_self.copyWith(streak: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapPathCopyWith<$Res>? get activeRoadmap {
    if (_self.activeRoadmap == null) {
    return null;
  }

  return $RoadmapPathCopyWith<$Res>(_self.activeRoadmap!, (value) {
    return _then(_self.copyWith(activeRoadmap: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicItemCopyWith<$Res>? get nextTopic {
    if (_self.nextTopic == null) {
    return null;
  }

  return $TopicItemCopyWith<$Res>(_self.nextTopic!, (value) {
    return _then(_self.copyWith(nextTopic: value));
  });
}
}

// dart format on
