// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roadmap_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoadmapProgress {

 Roadmap get roadmap; int get completedTopics; int get totalTopics;
/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapProgressCopyWith<RoadmapProgress> get copyWith => _$RoadmapProgressCopyWithImpl<RoadmapProgress>(this as RoadmapProgress, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoadmapProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapProgress&&(identical(other.roadmap, _this.roadmap) || other.roadmap == _this.roadmap)&&(identical(other.completedTopics, _this.completedTopics) || other.completedTopics == _this.completedTopics)&&(identical(other.totalTopics, _this.totalTopics) || other.totalTopics == _this.totalTopics));
}


@override
int get hashCode {
  final _this = this as RoadmapProgress;
  return Object.hash(runtimeType,_this.roadmap,_this.completedTopics,_this.totalTopics);
}

@override
String toString() {
  final _this = this as RoadmapProgress;
  return 'RoadmapProgress(roadmap: ${_this.roadmap}, completedTopics: ${_this.completedTopics}, totalTopics: ${_this.totalTopics})';
}


}

/// @nodoc
abstract mixin class $RoadmapProgressCopyWith<$Res>  {
  factory $RoadmapProgressCopyWith(RoadmapProgress value, $Res Function(RoadmapProgress) _then) = _$RoadmapProgressCopyWithImpl;
@useResult
$Res call({
 Roadmap roadmap, int completedTopics, int totalTopics
});


$RoadmapCopyWith<$Res> get roadmap;

}
/// @nodoc
class _$RoadmapProgressCopyWithImpl<$Res>
    implements $RoadmapProgressCopyWith<$Res> {
  _$RoadmapProgressCopyWithImpl(this._self, this._then);

  final RoadmapProgress _self;
  final $Res Function(RoadmapProgress) _then;

/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roadmap = null,Object? completedTopics = null,Object? totalTopics = null,}) {
  return _then(RoadmapProgress(
roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,completedTopics: null == completedTopics ? _self.completedTopics : completedTopics // ignore: cast_nullable_to_non_nullable
as int,totalTopics: null == totalTopics ? _self.totalTopics : totalTopics // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapCopyWith<$Res> get roadmap {
  
  return $RoadmapCopyWith<$Res>(_self.roadmap, (value) {
    return _then(_self.copyWith(roadmap: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadmapProgress].
extension RoadmapProgressPatterns on RoadmapProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapProgress value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapProgress value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Roadmap roadmap,  int completedTopics,  int totalTopics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapProgress() when $default != null:
return $default(_that.roadmap,_that.completedTopics,_that.totalTopics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Roadmap roadmap,  int completedTopics,  int totalTopics)  $default,) {final _that = this;
switch (_that) {
case _RoadmapProgress():
return $default(_that.roadmap,_that.completedTopics,_that.totalTopics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Roadmap roadmap,  int completedTopics,  int totalTopics)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapProgress() when $default != null:
return $default(_that.roadmap,_that.completedTopics,_that.totalTopics);case _:
  return null;

}
}

}

/// @nodoc


class _RoadmapProgress extends RoadmapProgress {
  const _RoadmapProgress({required this.roadmap, required this.completedTopics, required this.totalTopics}): super._();
  

@override final  Roadmap roadmap;
@override final  int completedTopics;
@override final  int totalTopics;

/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapProgressCopyWith<_RoadmapProgress> get copyWith => __$RoadmapProgressCopyWithImpl<_RoadmapProgress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapProgress&&(identical(other.roadmap, roadmap) || other.roadmap == roadmap)&&(identical(other.completedTopics, completedTopics) || other.completedTopics == completedTopics)&&(identical(other.totalTopics, totalTopics) || other.totalTopics == totalTopics));
}


@override
int get hashCode {
    return Object.hash(runtimeType,roadmap,completedTopics,totalTopics);
}

@override
String toString() {
    return 'RoadmapProgress(roadmap: $roadmap, completedTopics: $completedTopics, totalTopics: $totalTopics)';
}


}

/// @nodoc
abstract mixin class _$RoadmapProgressCopyWith<$Res> implements $RoadmapProgressCopyWith<$Res> {
  factory _$RoadmapProgressCopyWith(_RoadmapProgress value, $Res Function(_RoadmapProgress) _then) = __$RoadmapProgressCopyWithImpl;
@override @useResult
$Res call({
 Roadmap roadmap, int completedTopics, int totalTopics
});


@override $RoadmapCopyWith<$Res> get roadmap;

}
/// @nodoc
class __$RoadmapProgressCopyWithImpl<$Res>
    implements _$RoadmapProgressCopyWith<$Res> {
  __$RoadmapProgressCopyWithImpl(this._self, this._then);

  final _RoadmapProgress _self;
  final $Res Function(_RoadmapProgress) _then;

/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roadmap = null,Object? completedTopics = null,Object? totalTopics = null,}) {
  return _then(_RoadmapProgress(
roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,completedTopics: null == completedTopics ? _self.completedTopics : completedTopics // ignore: cast_nullable_to_non_nullable
as int,totalTopics: null == totalTopics ? _self.totalTopics : totalTopics // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RoadmapProgress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapCopyWith<$Res> get roadmap {
  
  return $RoadmapCopyWith<$Res>(_self.roadmap, (value) {
    return _then(_self.copyWith(roadmap: value));
  });
}
}

/// @nodoc
mixin _$SyncResult {

 int get version; int get newRoadmaps; int get newTopics; int get newResources; int get newChallenges;
/// Create a copy of SyncResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncResultCopyWith<SyncResult> get copyWith => _$SyncResultCopyWithImpl<SyncResult>(this as SyncResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SyncResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncResult&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.newRoadmaps, _this.newRoadmaps) || other.newRoadmaps == _this.newRoadmaps)&&(identical(other.newTopics, _this.newTopics) || other.newTopics == _this.newTopics)&&(identical(other.newResources, _this.newResources) || other.newResources == _this.newResources)&&(identical(other.newChallenges, _this.newChallenges) || other.newChallenges == _this.newChallenges));
}


@override
int get hashCode {
  final _this = this as SyncResult;
  return Object.hash(runtimeType,_this.version,_this.newRoadmaps,_this.newTopics,_this.newResources,_this.newChallenges);
}

@override
String toString() {
  final _this = this as SyncResult;
  return 'SyncResult(version: ${_this.version}, newRoadmaps: ${_this.newRoadmaps}, newTopics: ${_this.newTopics}, newResources: ${_this.newResources}, newChallenges: ${_this.newChallenges})';
}


}

/// @nodoc
abstract mixin class $SyncResultCopyWith<$Res>  {
  factory $SyncResultCopyWith(SyncResult value, $Res Function(SyncResult) _then) = _$SyncResultCopyWithImpl;
@useResult
$Res call({
 int version, int newRoadmaps, int newTopics, int newResources, int newChallenges
});




}
/// @nodoc
class _$SyncResultCopyWithImpl<$Res>
    implements $SyncResultCopyWith<$Res> {
  _$SyncResultCopyWithImpl(this._self, this._then);

  final SyncResult _self;
  final $Res Function(SyncResult) _then;

/// Create a copy of SyncResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? newRoadmaps = null,Object? newTopics = null,Object? newResources = null,Object? newChallenges = null,}) {
  return _then(SyncResult(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,newRoadmaps: null == newRoadmaps ? _self.newRoadmaps : newRoadmaps // ignore: cast_nullable_to_non_nullable
as int,newTopics: null == newTopics ? _self.newTopics : newTopics // ignore: cast_nullable_to_non_nullable
as int,newResources: null == newResources ? _self.newResources : newResources // ignore: cast_nullable_to_non_nullable
as int,newChallenges: null == newChallenges ? _self.newChallenges : newChallenges // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncResult].
extension SyncResultPatterns on SyncResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncResult value)  $default,){
final _that = this;
switch (_that) {
case _SyncResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncResult value)?  $default,){
final _that = this;
switch (_that) {
case _SyncResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  int newRoadmaps,  int newTopics,  int newResources,  int newChallenges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncResult() when $default != null:
return $default(_that.version,_that.newRoadmaps,_that.newTopics,_that.newResources,_that.newChallenges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  int newRoadmaps,  int newTopics,  int newResources,  int newChallenges)  $default,) {final _that = this;
switch (_that) {
case _SyncResult():
return $default(_that.version,_that.newRoadmaps,_that.newTopics,_that.newResources,_that.newChallenges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  int newRoadmaps,  int newTopics,  int newResources,  int newChallenges)?  $default,) {final _that = this;
switch (_that) {
case _SyncResult() when $default != null:
return $default(_that.version,_that.newRoadmaps,_that.newTopics,_that.newResources,_that.newChallenges);case _:
  return null;

}
}

}

/// @nodoc


class _SyncResult extends SyncResult {
  const _SyncResult({required this.version, this.newRoadmaps = 0, this.newTopics = 0, this.newResources = 0, this.newChallenges = 0}): super._();
  

@override final  int version;
@override@JsonKey() final  int newRoadmaps;
@override@JsonKey() final  int newTopics;
@override@JsonKey() final  int newResources;
@override@JsonKey() final  int newChallenges;

/// Create a copy of SyncResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncResultCopyWith<_SyncResult> get copyWith => __$SyncResultCopyWithImpl<_SyncResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncResult&&(identical(other.version, version) || other.version == version)&&(identical(other.newRoadmaps, newRoadmaps) || other.newRoadmaps == newRoadmaps)&&(identical(other.newTopics, newTopics) || other.newTopics == newTopics)&&(identical(other.newResources, newResources) || other.newResources == newResources)&&(identical(other.newChallenges, newChallenges) || other.newChallenges == newChallenges));
}


@override
int get hashCode {
    return Object.hash(runtimeType,version,newRoadmaps,newTopics,newResources,newChallenges);
}

@override
String toString() {
    return 'SyncResult(version: $version, newRoadmaps: $newRoadmaps, newTopics: $newTopics, newResources: $newResources, newChallenges: $newChallenges)';
}


}

/// @nodoc
abstract mixin class _$SyncResultCopyWith<$Res> implements $SyncResultCopyWith<$Res> {
  factory _$SyncResultCopyWith(_SyncResult value, $Res Function(_SyncResult) _then) = __$SyncResultCopyWithImpl;
@override @useResult
$Res call({
 int version, int newRoadmaps, int newTopics, int newResources, int newChallenges
});




}
/// @nodoc
class __$SyncResultCopyWithImpl<$Res>
    implements _$SyncResultCopyWith<$Res> {
  __$SyncResultCopyWithImpl(this._self, this._then);

  final _SyncResult _self;
  final $Res Function(_SyncResult) _then;

/// Create a copy of SyncResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? newRoadmaps = null,Object? newTopics = null,Object? newResources = null,Object? newChallenges = null,}) {
  return _then(_SyncResult(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,newRoadmaps: null == newRoadmaps ? _self.newRoadmaps : newRoadmaps // ignore: cast_nullable_to_non_nullable
as int,newTopics: null == newTopics ? _self.newTopics : newTopics // ignore: cast_nullable_to_non_nullable
as int,newResources: null == newResources ? _self.newResources : newResources // ignore: cast_nullable_to_non_nullable
as int,newChallenges: null == newChallenges ? _self.newChallenges : newChallenges // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
