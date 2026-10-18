// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Roadmap {

 String get id; String get title; String get description; RoadmapCategory get category;
/// Create a copy of Roadmap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapCopyWith<Roadmap> get copyWith => _$RoadmapCopyWithImpl<Roadmap>(this as Roadmap, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Roadmap;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Roadmap&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category));
}


@override
int get hashCode {
  final _this = this as Roadmap;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.category);
}

@override
String toString() {
  final _this = this as Roadmap;
  return 'Roadmap(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $RoadmapCopyWith<$Res>  {
  factory $RoadmapCopyWith(Roadmap value, $Res Function(Roadmap) _then) = _$RoadmapCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, RoadmapCategory category
});




}
/// @nodoc
class _$RoadmapCopyWithImpl<$Res>
    implements $RoadmapCopyWith<$Res> {
  _$RoadmapCopyWithImpl(this._self, this._then);

  final Roadmap _self;
  final $Res Function(Roadmap) _then;

/// Create a copy of Roadmap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,}) {
  return _then(Roadmap(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoadmapCategory,
  ));
}

}


/// Adds pattern-matching-related methods to [Roadmap].
extension RoadmapPatterns on Roadmap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Roadmap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Roadmap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Roadmap value)  $default,){
final _that = this;
switch (_that) {
case _Roadmap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Roadmap value)?  $default,){
final _that = this;
switch (_that) {
case _Roadmap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  RoadmapCategory category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Roadmap() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  RoadmapCategory category)  $default,) {final _that = this;
switch (_that) {
case _Roadmap():
return $default(_that.id,_that.title,_that.description,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  RoadmapCategory category)?  $default,) {final _that = this;
switch (_that) {
case _Roadmap() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _Roadmap implements Roadmap {
  const _Roadmap({required this.id, required this.title, required this.description, required this.category});
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  RoadmapCategory category;

/// Create a copy of Roadmap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapCopyWith<_Roadmap> get copyWith => __$RoadmapCopyWithImpl<_Roadmap>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Roadmap&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,category);
}

@override
String toString() {
    return 'Roadmap(id: $id, title: $title, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class _$RoadmapCopyWith<$Res> implements $RoadmapCopyWith<$Res> {
  factory _$RoadmapCopyWith(_Roadmap value, $Res Function(_Roadmap) _then) = __$RoadmapCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, RoadmapCategory category
});




}
/// @nodoc
class __$RoadmapCopyWithImpl<$Res>
    implements _$RoadmapCopyWith<$Res> {
  __$RoadmapCopyWithImpl(this._self, this._then);

  final _Roadmap _self;
  final $Res Function(_Roadmap) _then;

/// Create a copy of Roadmap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,}) {
  return _then(_Roadmap(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoadmapCategory,
  ));
}


}

/// @nodoc
mixin _$RoadmapSection {

 String get id; String get roadmapId; String get title;
/// Create a copy of RoadmapSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapSectionCopyWith<RoadmapSection> get copyWith => _$RoadmapSectionCopyWithImpl<RoadmapSection>(this as RoadmapSection, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoadmapSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapSection&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.roadmapId, _this.roadmapId) || other.roadmapId == _this.roadmapId)&&(identical(other.title, _this.title) || other.title == _this.title));
}


@override
int get hashCode {
  final _this = this as RoadmapSection;
  return Object.hash(runtimeType,_this.id,_this.roadmapId,_this.title);
}

@override
String toString() {
  final _this = this as RoadmapSection;
  return 'RoadmapSection(id: ${_this.id}, roadmapId: ${_this.roadmapId}, title: ${_this.title})';
}


}

/// @nodoc
abstract mixin class $RoadmapSectionCopyWith<$Res>  {
  factory $RoadmapSectionCopyWith(RoadmapSection value, $Res Function(RoadmapSection) _then) = _$RoadmapSectionCopyWithImpl;
@useResult
$Res call({
 String id, String roadmapId, String title
});




}
/// @nodoc
class _$RoadmapSectionCopyWithImpl<$Res>
    implements $RoadmapSectionCopyWith<$Res> {
  _$RoadmapSectionCopyWithImpl(this._self, this._then);

  final RoadmapSection _self;
  final $Res Function(RoadmapSection) _then;

/// Create a copy of RoadmapSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roadmapId = null,Object? title = null,}) {
  return _then(RoadmapSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roadmapId: null == roadmapId ? _self.roadmapId : roadmapId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadmapSection].
extension RoadmapSectionPatterns on RoadmapSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapSection value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapSection value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String roadmapId,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapSection() when $default != null:
return $default(_that.id,_that.roadmapId,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String roadmapId,  String title)  $default,) {final _that = this;
switch (_that) {
case _RoadmapSection():
return $default(_that.id,_that.roadmapId,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String roadmapId,  String title)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapSection() when $default != null:
return $default(_that.id,_that.roadmapId,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _RoadmapSection implements RoadmapSection {
  const _RoadmapSection({required this.id, required this.roadmapId, required this.title});
  

@override final  String id;
@override final  String roadmapId;
@override final  String title;

/// Create a copy of RoadmapSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapSectionCopyWith<_RoadmapSection> get copyWith => __$RoadmapSectionCopyWithImpl<_RoadmapSection>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapSection&&(identical(other.id, id) || other.id == id)&&(identical(other.roadmapId, roadmapId) || other.roadmapId == roadmapId)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,roadmapId,title);
}

@override
String toString() {
    return 'RoadmapSection(id: $id, roadmapId: $roadmapId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$RoadmapSectionCopyWith<$Res> implements $RoadmapSectionCopyWith<$Res> {
  factory _$RoadmapSectionCopyWith(_RoadmapSection value, $Res Function(_RoadmapSection) _then) = __$RoadmapSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String roadmapId, String title
});




}
/// @nodoc
class __$RoadmapSectionCopyWithImpl<$Res>
    implements _$RoadmapSectionCopyWith<$Res> {
  __$RoadmapSectionCopyWithImpl(this._self, this._then);

  final _RoadmapSection _self;
  final $Res Function(_RoadmapSection) _then;

/// Create a copy of RoadmapSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roadmapId = null,Object? title = null,}) {
  return _then(_RoadmapSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roadmapId: null == roadmapId ? _self.roadmapId : roadmapId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Topic {

 String get id; String get roadmapId; String get sectionId; String get title; String get description;/// What the learner should be able to do afterwards.
 List<String> get objectives; Difficulty get difficulty; int get estimatedMinutes;
/// Create a copy of Topic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicCopyWith<Topic> get copyWith => _$TopicCopyWithImpl<Topic>(this as Topic, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Topic;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Topic&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.roadmapId, _this.roadmapId) || other.roadmapId == _this.roadmapId)&&(identical(other.sectionId, _this.sectionId) || other.sectionId == _this.sectionId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.objectives, _this.objectives)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes));
}


@override
int get hashCode {
  final _this = this as Topic;
  return Object.hash(runtimeType,_this.id,_this.roadmapId,_this.sectionId,_this.title,_this.description,const DeepCollectionEquality().hash(_this.objectives),_this.difficulty,_this.estimatedMinutes);
}

@override
String toString() {
  final _this = this as Topic;
  return 'Topic(id: ${_this.id}, roadmapId: ${_this.roadmapId}, sectionId: ${_this.sectionId}, title: ${_this.title}, description: ${_this.description}, objectives: ${_this.objectives}, difficulty: ${_this.difficulty}, estimatedMinutes: ${_this.estimatedMinutes})';
}


}

/// @nodoc
abstract mixin class $TopicCopyWith<$Res>  {
  factory $TopicCopyWith(Topic value, $Res Function(Topic) _then) = _$TopicCopyWithImpl;
@useResult
$Res call({
 String id, String roadmapId, String sectionId, String title, String description, List<String> objectives, Difficulty difficulty, int estimatedMinutes
});




}
/// @nodoc
class _$TopicCopyWithImpl<$Res>
    implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._self, this._then);

  final Topic _self;
  final $Res Function(Topic) _then;

/// Create a copy of Topic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roadmapId = null,Object? sectionId = null,Object? title = null,Object? description = null,Object? objectives = null,Object? difficulty = null,Object? estimatedMinutes = null,}) {
  return _then(Topic(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roadmapId: null == roadmapId ? _self.roadmapId : roadmapId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,objectives: null == objectives ? _self.objectives : objectives // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Topic].
extension TopicPatterns on Topic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Topic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Topic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Topic value)  $default,){
final _that = this;
switch (_that) {
case _Topic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Topic value)?  $default,){
final _that = this;
switch (_that) {
case _Topic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String roadmapId,  String sectionId,  String title,  String description,  List<String> objectives,  Difficulty difficulty,  int estimatedMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Topic() when $default != null:
return $default(_that.id,_that.roadmapId,_that.sectionId,_that.title,_that.description,_that.objectives,_that.difficulty,_that.estimatedMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String roadmapId,  String sectionId,  String title,  String description,  List<String> objectives,  Difficulty difficulty,  int estimatedMinutes)  $default,) {final _that = this;
switch (_that) {
case _Topic():
return $default(_that.id,_that.roadmapId,_that.sectionId,_that.title,_that.description,_that.objectives,_that.difficulty,_that.estimatedMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String roadmapId,  String sectionId,  String title,  String description,  List<String> objectives,  Difficulty difficulty,  int estimatedMinutes)?  $default,) {final _that = this;
switch (_that) {
case _Topic() when $default != null:
return $default(_that.id,_that.roadmapId,_that.sectionId,_that.title,_that.description,_that.objectives,_that.difficulty,_that.estimatedMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _Topic implements Topic {
  const _Topic({required this.id, required this.roadmapId, required this.sectionId, required this.title, required this.description, required  List<String> objectives, required this.difficulty, required this.estimatedMinutes}): _objectives = objectives;
  

@override final  String id;
@override final  String roadmapId;
@override final  String sectionId;
@override final  String title;
@override final  String description;
/// What the learner should be able to do afterwards.
 final  List<String> _objectives;
/// What the learner should be able to do afterwards.
@override List<String> get objectives {
  if (_objectives is EqualUnmodifiableListView) return _objectives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objectives);
}

@override final  Difficulty difficulty;
@override final  int estimatedMinutes;

/// Create a copy of Topic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicCopyWith<_Topic> get copyWith => __$TopicCopyWithImpl<_Topic>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Topic&&(identical(other.id, id) || other.id == id)&&(identical(other.roadmapId, roadmapId) || other.roadmapId == roadmapId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.objectives, _objectives)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,roadmapId,sectionId,title,description,const DeepCollectionEquality().hash(_objectives),difficulty,estimatedMinutes);
}

@override
String toString() {
    return 'Topic(id: $id, roadmapId: $roadmapId, sectionId: $sectionId, title: $title, description: $description, objectives: $objectives, difficulty: $difficulty, estimatedMinutes: $estimatedMinutes)';
}


}

/// @nodoc
abstract mixin class _$TopicCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$TopicCopyWith(_Topic value, $Res Function(_Topic) _then) = __$TopicCopyWithImpl;
@override @useResult
$Res call({
 String id, String roadmapId, String sectionId, String title, String description, List<String> objectives, Difficulty difficulty, int estimatedMinutes
});




}
/// @nodoc
class __$TopicCopyWithImpl<$Res>
    implements _$TopicCopyWith<$Res> {
  __$TopicCopyWithImpl(this._self, this._then);

  final _Topic _self;
  final $Res Function(_Topic) _then;

/// Create a copy of Topic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roadmapId = null,Object? sectionId = null,Object? title = null,Object? description = null,Object? objectives = null,Object? difficulty = null,Object? estimatedMinutes = null,}) {
  return _then(_Topic(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roadmapId: null == roadmapId ? _self.roadmapId : roadmapId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,objectives: null == objectives ? _self._objectives : objectives // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Resource {

 String get id; String get title; ResourceType get type;/// Always `https`.
 Uri get url;/// Where it's published, for display: "dart.dev".
 String get source; int get estimatedMinutes;/// The topic it helps with, if any.
 String? get topicId;
/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCopyWith<Resource> get copyWith => _$ResourceCopyWithImpl<Resource>(this as Resource, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Resource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes)&&(identical(other.topicId, _this.topicId) || other.topicId == _this.topicId));
}


@override
int get hashCode {
  final _this = this as Resource;
  return Object.hash(runtimeType,_this.id,_this.title,_this.type,_this.url,_this.source,_this.estimatedMinutes,_this.topicId);
}

@override
String toString() {
  final _this = this as Resource;
  return 'Resource(id: ${_this.id}, title: ${_this.title}, type: ${_this.type}, url: ${_this.url}, source: ${_this.source}, estimatedMinutes: ${_this.estimatedMinutes}, topicId: ${_this.topicId})';
}


}

/// @nodoc
abstract mixin class $ResourceCopyWith<$Res>  {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) _then) = _$ResourceCopyWithImpl;
@useResult
$Res call({
 String id, String title, ResourceType type, Uri url, String source, int estimatedMinutes, String? topicId
});




}
/// @nodoc
class _$ResourceCopyWithImpl<$Res>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._self, this._then);

  final Resource _self;
  final $Res Function(Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? type = null,Object? url = null,Object? source = null,Object? estimatedMinutes = null,Object? topicId = freezed,}) {
  return _then(Resource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns on Resource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resource value)  $default,){
final _that = this;
switch (_that) {
case _Resource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resource value)?  $default,){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  ResourceType type,  Uri url,  String source,  int estimatedMinutes,  String? topicId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.url,_that.source,_that.estimatedMinutes,_that.topicId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  ResourceType type,  Uri url,  String source,  int estimatedMinutes,  String? topicId)  $default,) {final _that = this;
switch (_that) {
case _Resource():
return $default(_that.id,_that.title,_that.type,_that.url,_that.source,_that.estimatedMinutes,_that.topicId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  ResourceType type,  Uri url,  String source,  int estimatedMinutes,  String? topicId)?  $default,) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.url,_that.source,_that.estimatedMinutes,_that.topicId);case _:
  return null;

}
}

}

/// @nodoc


class _Resource implements Resource {
  const _Resource({required this.id, required this.title, required this.type, required this.url, required this.source, required this.estimatedMinutes, this.topicId});
  

@override final  String id;
@override final  String title;
@override final  ResourceType type;
/// Always `https`.
@override final  Uri url;
/// Where it's published, for display: "dart.dev".
@override final  String source;
@override final  int estimatedMinutes;
/// The topic it helps with, if any.
@override final  String? topicId;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCopyWith<_Resource> get copyWith => __$ResourceCopyWithImpl<_Resource>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resource&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.topicId, topicId) || other.topicId == topicId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,type,url,source,estimatedMinutes,topicId);
}

@override
String toString() {
    return 'Resource(id: $id, title: $title, type: $type, url: $url, source: $source, estimatedMinutes: $estimatedMinutes, topicId: $topicId)';
}


}

/// @nodoc
abstract mixin class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) _then) = __$ResourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, ResourceType type, Uri url, String source, int estimatedMinutes, String? topicId
});




}
/// @nodoc
class __$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(this._self, this._then);

  final _Resource _self;
  final $Res Function(_Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? type = null,Object? url = null,Object? source = null,Object? estimatedMinutes = null,Object? topicId = freezed,}) {
  return _then(_Resource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Challenge {

 String get id; String get title; ChallengeCategory get category; Difficulty get difficulty; String get prompt;/// Revealed one at a time.
 List<String> get hints;
/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeCopyWith<Challenge> get copyWith => _$ChallengeCopyWithImpl<Challenge>(this as Challenge, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Challenge;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Challenge&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.prompt, _this.prompt) || other.prompt == _this.prompt)&&const DeepCollectionEquality().equals(other.hints, _this.hints));
}


@override
int get hashCode {
  final _this = this as Challenge;
  return Object.hash(runtimeType,_this.id,_this.title,_this.category,_this.difficulty,_this.prompt,const DeepCollectionEquality().hash(_this.hints));
}

@override
String toString() {
  final _this = this as Challenge;
  return 'Challenge(id: ${_this.id}, title: ${_this.title}, category: ${_this.category}, difficulty: ${_this.difficulty}, prompt: ${_this.prompt}, hints: ${_this.hints})';
}


}

/// @nodoc
abstract mixin class $ChallengeCopyWith<$Res>  {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) _then) = _$ChallengeCopyWithImpl;
@useResult
$Res call({
 String id, String title, ChallengeCategory category, Difficulty difficulty, String prompt, List<String> hints
});




}
/// @nodoc
class _$ChallengeCopyWithImpl<$Res>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._self, this._then);

  final Challenge _self;
  final $Res Function(Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? category = null,Object? difficulty = null,Object? prompt = null,Object? hints = null,}) {
  return _then(Challenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChallengeCategory,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,hints: null == hints ? _self.hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Challenge].
extension ChallengePatterns on Challenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Challenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Challenge value)  $default,){
final _that = this;
switch (_that) {
case _Challenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Challenge value)?  $default,){
final _that = this;
switch (_that) {
case _Challenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  ChallengeCategory category,  Difficulty difficulty,  String prompt,  List<String> hints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.difficulty,_that.prompt,_that.hints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  ChallengeCategory category,  Difficulty difficulty,  String prompt,  List<String> hints)  $default,) {final _that = this;
switch (_that) {
case _Challenge():
return $default(_that.id,_that.title,_that.category,_that.difficulty,_that.prompt,_that.hints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  ChallengeCategory category,  Difficulty difficulty,  String prompt,  List<String> hints)?  $default,) {final _that = this;
switch (_that) {
case _Challenge() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.difficulty,_that.prompt,_that.hints);case _:
  return null;

}
}

}

/// @nodoc


class _Challenge implements Challenge {
  const _Challenge({required this.id, required this.title, required this.category, required this.difficulty, required this.prompt, required  List<String> hints}): _hints = hints;
  

@override final  String id;
@override final  String title;
@override final  ChallengeCategory category;
@override final  Difficulty difficulty;
@override final  String prompt;
/// Revealed one at a time.
 final  List<String> _hints;
/// Revealed one at a time.
@override List<String> get hints {
  if (_hints is EqualUnmodifiableListView) return _hints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hints);
}


/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeCopyWith<_Challenge> get copyWith => __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Challenge&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.hints, _hints));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,category,difficulty,prompt,const DeepCollectionEquality().hash(_hints));
}

@override
String toString() {
    return 'Challenge(id: $id, title: $title, category: $category, difficulty: $difficulty, prompt: $prompt, hints: $hints)';
}


}

/// @nodoc
abstract mixin class _$ChallengeCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(_Challenge value, $Res Function(_Challenge) _then) = __$ChallengeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, ChallengeCategory category, Difficulty difficulty, String prompt, List<String> hints
});




}
/// @nodoc
class __$ChallengeCopyWithImpl<$Res>
    implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(this._self, this._then);

  final _Challenge _self;
  final $Res Function(_Challenge) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? category = null,Object? difficulty = null,Object? prompt = null,Object? hints = null,}) {
  return _then(_Challenge(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ChallengeCategory,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,hints: null == hints ? _self._hints : hints // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
