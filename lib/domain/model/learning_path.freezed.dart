// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_path.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicItem {

 Topic get topic;/// The day it was completed; `null` while it isn't.
 CalendarDate? get completedOn; bool get bookmarked;
/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicItemCopyWith<TopicItem> get copyWith => _$TopicItemCopyWithImpl<TopicItem>(this as TopicItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopicItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicItem&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.completedOn, _this.completedOn) || other.completedOn == _this.completedOn)&&(identical(other.bookmarked, _this.bookmarked) || other.bookmarked == _this.bookmarked));
}


@override
int get hashCode {
  final _this = this as TopicItem;
  return Object.hash(runtimeType,_this.topic,_this.completedOn,_this.bookmarked);
}

@override
String toString() {
  final _this = this as TopicItem;
  return 'TopicItem(topic: ${_this.topic}, completedOn: ${_this.completedOn}, bookmarked: ${_this.bookmarked})';
}


}

/// @nodoc
abstract mixin class $TopicItemCopyWith<$Res>  {
  factory $TopicItemCopyWith(TopicItem value, $Res Function(TopicItem) _then) = _$TopicItemCopyWithImpl;
@useResult
$Res call({
 Topic topic, CalendarDate? completedOn, bool bookmarked
});


$TopicCopyWith<$Res> get topic;

}
/// @nodoc
class _$TopicItemCopyWithImpl<$Res>
    implements $TopicItemCopyWith<$Res> {
  _$TopicItemCopyWithImpl(this._self, this._then);

  final TopicItem _self;
  final $Res Function(TopicItem) _then;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? completedOn = freezed,Object? bookmarked = null,}) {
  return _then(TopicItem(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as Topic,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as CalendarDate?,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicCopyWith<$Res> get topic {
  
  return $TopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicItem].
extension TopicItemPatterns on TopicItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicItem value)  $default,){
final _that = this;
switch (_that) {
case _TopicItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicItem value)?  $default,){
final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Topic topic,  CalendarDate? completedOn,  bool bookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that.topic,_that.completedOn,_that.bookmarked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Topic topic,  CalendarDate? completedOn,  bool bookmarked)  $default,) {final _that = this;
switch (_that) {
case _TopicItem():
return $default(_that.topic,_that.completedOn,_that.bookmarked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Topic topic,  CalendarDate? completedOn,  bool bookmarked)?  $default,) {final _that = this;
switch (_that) {
case _TopicItem() when $default != null:
return $default(_that.topic,_that.completedOn,_that.bookmarked);case _:
  return null;

}
}

}

/// @nodoc


class _TopicItem extends TopicItem {
  const _TopicItem({required this.topic, this.completedOn, this.bookmarked = false}): super._();
  

@override final  Topic topic;
/// The day it was completed; `null` while it isn't.
@override final  CalendarDate? completedOn;
@override@JsonKey() final  bool bookmarked;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicItemCopyWith<_TopicItem> get copyWith => __$TopicItemCopyWithImpl<_TopicItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicItem&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.completedOn, completedOn) || other.completedOn == completedOn)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked));
}


@override
int get hashCode {
    return Object.hash(runtimeType,topic,completedOn,bookmarked);
}

@override
String toString() {
    return 'TopicItem(topic: $topic, completedOn: $completedOn, bookmarked: $bookmarked)';
}


}

/// @nodoc
abstract mixin class _$TopicItemCopyWith<$Res> implements $TopicItemCopyWith<$Res> {
  factory _$TopicItemCopyWith(_TopicItem value, $Res Function(_TopicItem) _then) = __$TopicItemCopyWithImpl;
@override @useResult
$Res call({
 Topic topic, CalendarDate? completedOn, bool bookmarked
});


@override $TopicCopyWith<$Res> get topic;

}
/// @nodoc
class __$TopicItemCopyWithImpl<$Res>
    implements _$TopicItemCopyWith<$Res> {
  __$TopicItemCopyWithImpl(this._self, this._then);

  final _TopicItem _self;
  final $Res Function(_TopicItem) _then;

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? completedOn = freezed,Object? bookmarked = null,}) {
  return _then(_TopicItem(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as Topic,completedOn: freezed == completedOn ? _self.completedOn : completedOn // ignore: cast_nullable_to_non_nullable
as CalendarDate?,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TopicItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicCopyWith<$Res> get topic {
  
  return $TopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}

/// @nodoc
mixin _$SectionPath {

 RoadmapSection get section; List<TopicItem> get topics;
/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionPathCopyWith<SectionPath> get copyWith => _$SectionPathCopyWithImpl<SectionPath>(this as SectionPath, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SectionPath;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionPath&&(identical(other.section, _this.section) || other.section == _this.section)&&const DeepCollectionEquality().equals(other.topics, _this.topics));
}


@override
int get hashCode {
  final _this = this as SectionPath;
  return Object.hash(runtimeType,_this.section,const DeepCollectionEquality().hash(_this.topics));
}

@override
String toString() {
  final _this = this as SectionPath;
  return 'SectionPath(section: ${_this.section}, topics: ${_this.topics})';
}


}

/// @nodoc
abstract mixin class $SectionPathCopyWith<$Res>  {
  factory $SectionPathCopyWith(SectionPath value, $Res Function(SectionPath) _then) = _$SectionPathCopyWithImpl;
@useResult
$Res call({
 RoadmapSection section, List<TopicItem> topics
});


$RoadmapSectionCopyWith<$Res> get section;

}
/// @nodoc
class _$SectionPathCopyWithImpl<$Res>
    implements $SectionPathCopyWith<$Res> {
  _$SectionPathCopyWithImpl(this._self, this._then);

  final SectionPath _self;
  final $Res Function(SectionPath) _then;

/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? section = null,Object? topics = null,}) {
  return _then(SectionPath(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RoadmapSection,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicItem>,
  ));
}
/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapSectionCopyWith<$Res> get section {
  
  return $RoadmapSectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionPath].
extension SectionPathPatterns on SectionPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionPath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionPath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionPath value)  $default,){
final _that = this;
switch (_that) {
case _SectionPath():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionPath value)?  $default,){
final _that = this;
switch (_that) {
case _SectionPath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoadmapSection section,  List<TopicItem> topics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionPath() when $default != null:
return $default(_that.section,_that.topics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoadmapSection section,  List<TopicItem> topics)  $default,) {final _that = this;
switch (_that) {
case _SectionPath():
return $default(_that.section,_that.topics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoadmapSection section,  List<TopicItem> topics)?  $default,) {final _that = this;
switch (_that) {
case _SectionPath() when $default != null:
return $default(_that.section,_that.topics);case _:
  return null;

}
}

}

/// @nodoc


class _SectionPath extends SectionPath {
  const _SectionPath({required this.section, required  List<TopicItem> topics}): _topics = topics,super._();
  

@override final  RoadmapSection section;
 final  List<TopicItem> _topics;
@override List<TopicItem> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}


/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionPathCopyWith<_SectionPath> get copyWith => __$SectionPathCopyWithImpl<_SectionPath>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionPath&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other.topics, _topics));
}


@override
int get hashCode {
    return Object.hash(runtimeType,section,const DeepCollectionEquality().hash(_topics));
}

@override
String toString() {
    return 'SectionPath(section: $section, topics: $topics)';
}


}

/// @nodoc
abstract mixin class _$SectionPathCopyWith<$Res> implements $SectionPathCopyWith<$Res> {
  factory _$SectionPathCopyWith(_SectionPath value, $Res Function(_SectionPath) _then) = __$SectionPathCopyWithImpl;
@override @useResult
$Res call({
 RoadmapSection section, List<TopicItem> topics
});


@override $RoadmapSectionCopyWith<$Res> get section;

}
/// @nodoc
class __$SectionPathCopyWithImpl<$Res>
    implements _$SectionPathCopyWith<$Res> {
  __$SectionPathCopyWithImpl(this._self, this._then);

  final _SectionPath _self;
  final $Res Function(_SectionPath) _then;

/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? section = null,Object? topics = null,}) {
  return _then(_SectionPath(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RoadmapSection,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<TopicItem>,
  ));
}

/// Create a copy of SectionPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapSectionCopyWith<$Res> get section {
  
  return $RoadmapSectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc
mixin _$RoadmapPath {

 Roadmap get roadmap; List<SectionPath> get sections;
/// Create a copy of RoadmapPath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadmapPathCopyWith<RoadmapPath> get copyWith => _$RoadmapPathCopyWithImpl<RoadmapPath>(this as RoadmapPath, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoadmapPath;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadmapPath&&(identical(other.roadmap, _this.roadmap) || other.roadmap == _this.roadmap)&&const DeepCollectionEquality().equals(other.sections, _this.sections));
}


@override
int get hashCode {
  final _this = this as RoadmapPath;
  return Object.hash(runtimeType,_this.roadmap,const DeepCollectionEquality().hash(_this.sections));
}

@override
String toString() {
  final _this = this as RoadmapPath;
  return 'RoadmapPath(roadmap: ${_this.roadmap}, sections: ${_this.sections})';
}


}

/// @nodoc
abstract mixin class $RoadmapPathCopyWith<$Res>  {
  factory $RoadmapPathCopyWith(RoadmapPath value, $Res Function(RoadmapPath) _then) = _$RoadmapPathCopyWithImpl;
@useResult
$Res call({
 Roadmap roadmap, List<SectionPath> sections
});


$RoadmapCopyWith<$Res> get roadmap;

}
/// @nodoc
class _$RoadmapPathCopyWithImpl<$Res>
    implements $RoadmapPathCopyWith<$Res> {
  _$RoadmapPathCopyWithImpl(this._self, this._then);

  final RoadmapPath _self;
  final $Res Function(RoadmapPath) _then;

/// Create a copy of RoadmapPath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roadmap = null,Object? sections = null,}) {
  return _then(RoadmapPath(
roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionPath>,
  ));
}
/// Create a copy of RoadmapPath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapCopyWith<$Res> get roadmap {
  
  return $RoadmapCopyWith<$Res>(_self.roadmap, (value) {
    return _then(_self.copyWith(roadmap: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadmapPath].
extension RoadmapPathPatterns on RoadmapPath {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadmapPath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadmapPath() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadmapPath value)  $default,){
final _that = this;
switch (_that) {
case _RoadmapPath():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadmapPath value)?  $default,){
final _that = this;
switch (_that) {
case _RoadmapPath() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Roadmap roadmap,  List<SectionPath> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadmapPath() when $default != null:
return $default(_that.roadmap,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Roadmap roadmap,  List<SectionPath> sections)  $default,) {final _that = this;
switch (_that) {
case _RoadmapPath():
return $default(_that.roadmap,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Roadmap roadmap,  List<SectionPath> sections)?  $default,) {final _that = this;
switch (_that) {
case _RoadmapPath() when $default != null:
return $default(_that.roadmap,_that.sections);case _:
  return null;

}
}

}

/// @nodoc


class _RoadmapPath extends RoadmapPath {
  const _RoadmapPath({required this.roadmap, required  List<SectionPath> sections}): _sections = sections,super._();
  

@override final  Roadmap roadmap;
 final  List<SectionPath> _sections;
@override List<SectionPath> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of RoadmapPath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadmapPathCopyWith<_RoadmapPath> get copyWith => __$RoadmapPathCopyWithImpl<_RoadmapPath>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadmapPath&&(identical(other.roadmap, roadmap) || other.roadmap == roadmap)&&const DeepCollectionEquality().equals(other.sections, _sections));
}


@override
int get hashCode {
    return Object.hash(runtimeType,roadmap,const DeepCollectionEquality().hash(_sections));
}

@override
String toString() {
    return 'RoadmapPath(roadmap: $roadmap, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$RoadmapPathCopyWith<$Res> implements $RoadmapPathCopyWith<$Res> {
  factory _$RoadmapPathCopyWith(_RoadmapPath value, $Res Function(_RoadmapPath) _then) = __$RoadmapPathCopyWithImpl;
@override @useResult
$Res call({
 Roadmap roadmap, List<SectionPath> sections
});


@override $RoadmapCopyWith<$Res> get roadmap;

}
/// @nodoc
class __$RoadmapPathCopyWithImpl<$Res>
    implements _$RoadmapPathCopyWith<$Res> {
  __$RoadmapPathCopyWithImpl(this._self, this._then);

  final _RoadmapPath _self;
  final $Res Function(_RoadmapPath) _then;

/// Create a copy of RoadmapPath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roadmap = null,Object? sections = null,}) {
  return _then(_RoadmapPath(
roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionPath>,
  ));
}

/// Create a copy of RoadmapPath
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
mixin _$TopicDetails {

 TopicItem get item; Roadmap get roadmap; RoadmapSection get section;
/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDetailsCopyWith<TopicDetails> get copyWith => _$TopicDetailsCopyWithImpl<TopicDetails>(this as TopicDetails, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopicDetails;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetails&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.roadmap, _this.roadmap) || other.roadmap == _this.roadmap)&&(identical(other.section, _this.section) || other.section == _this.section));
}


@override
int get hashCode {
  final _this = this as TopicDetails;
  return Object.hash(runtimeType,_this.item,_this.roadmap,_this.section);
}

@override
String toString() {
  final _this = this as TopicDetails;
  return 'TopicDetails(item: ${_this.item}, roadmap: ${_this.roadmap}, section: ${_this.section})';
}


}

/// @nodoc
abstract mixin class $TopicDetailsCopyWith<$Res>  {
  factory $TopicDetailsCopyWith(TopicDetails value, $Res Function(TopicDetails) _then) = _$TopicDetailsCopyWithImpl;
@useResult
$Res call({
 TopicItem item, Roadmap roadmap, RoadmapSection section
});


$TopicItemCopyWith<$Res> get item;$RoadmapCopyWith<$Res> get roadmap;$RoadmapSectionCopyWith<$Res> get section;

}
/// @nodoc
class _$TopicDetailsCopyWithImpl<$Res>
    implements $TopicDetailsCopyWith<$Res> {
  _$TopicDetailsCopyWithImpl(this._self, this._then);

  final TopicDetails _self;
  final $Res Function(TopicDetails) _then;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? roadmap = null,Object? section = null,}) {
  return _then(TopicDetails(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TopicItem,roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RoadmapSection,
  ));
}
/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicItemCopyWith<$Res> get item {
  
  return $TopicItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapCopyWith<$Res> get roadmap {
  
  return $RoadmapCopyWith<$Res>(_self.roadmap, (value) {
    return _then(_self.copyWith(roadmap: value));
  });
}/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapSectionCopyWith<$Res> get section {
  
  return $RoadmapSectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopicDetails].
extension TopicDetailsPatterns on TopicDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDetails value)  $default,){
final _that = this;
switch (_that) {
case _TopicDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDetails value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TopicItem item,  Roadmap roadmap,  RoadmapSection section)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that.item,_that.roadmap,_that.section);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TopicItem item,  Roadmap roadmap,  RoadmapSection section)  $default,) {final _that = this;
switch (_that) {
case _TopicDetails():
return $default(_that.item,_that.roadmap,_that.section);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TopicItem item,  Roadmap roadmap,  RoadmapSection section)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that.item,_that.roadmap,_that.section);case _:
  return null;

}
}

}

/// @nodoc


class _TopicDetails implements TopicDetails {
  const _TopicDetails({required this.item, required this.roadmap, required this.section});
  

@override final  TopicItem item;
@override final  Roadmap roadmap;
@override final  RoadmapSection section;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDetailsCopyWith<_TopicDetails> get copyWith => __$TopicDetailsCopyWithImpl<_TopicDetails>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetails&&(identical(other.item, item) || other.item == item)&&(identical(other.roadmap, roadmap) || other.roadmap == roadmap)&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode {
    return Object.hash(runtimeType,item,roadmap,section);
}

@override
String toString() {
    return 'TopicDetails(item: $item, roadmap: $roadmap, section: $section)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailsCopyWith<$Res> implements $TopicDetailsCopyWith<$Res> {
  factory _$TopicDetailsCopyWith(_TopicDetails value, $Res Function(_TopicDetails) _then) = __$TopicDetailsCopyWithImpl;
@override @useResult
$Res call({
 TopicItem item, Roadmap roadmap, RoadmapSection section
});


@override $TopicItemCopyWith<$Res> get item;@override $RoadmapCopyWith<$Res> get roadmap;@override $RoadmapSectionCopyWith<$Res> get section;

}
/// @nodoc
class __$TopicDetailsCopyWithImpl<$Res>
    implements _$TopicDetailsCopyWith<$Res> {
  __$TopicDetailsCopyWithImpl(this._self, this._then);

  final _TopicDetails _self;
  final $Res Function(_TopicDetails) _then;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? roadmap = null,Object? section = null,}) {
  return _then(_TopicDetails(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as TopicItem,roadmap: null == roadmap ? _self.roadmap : roadmap // ignore: cast_nullable_to_non_nullable
as Roadmap,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as RoadmapSection,
  ));
}

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopicItemCopyWith<$Res> get item {
  
  return $TopicItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapCopyWith<$Res> get roadmap {
  
  return $RoadmapCopyWith<$Res>(_self.roadmap, (value) {
    return _then(_self.copyWith(roadmap: value));
  });
}/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadmapSectionCopyWith<$Res> get section {
  
  return $RoadmapSectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc
mixin _$TopicChoice {

 String get id; String get title; String get roadmapTitle;
/// Create a copy of TopicChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicChoiceCopyWith<TopicChoice> get copyWith => _$TopicChoiceCopyWithImpl<TopicChoice>(this as TopicChoice, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopicChoice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicChoice&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.roadmapTitle, _this.roadmapTitle) || other.roadmapTitle == _this.roadmapTitle));
}


@override
int get hashCode {
  final _this = this as TopicChoice;
  return Object.hash(runtimeType,_this.id,_this.title,_this.roadmapTitle);
}

@override
String toString() {
  final _this = this as TopicChoice;
  return 'TopicChoice(id: ${_this.id}, title: ${_this.title}, roadmapTitle: ${_this.roadmapTitle})';
}


}

/// @nodoc
abstract mixin class $TopicChoiceCopyWith<$Res>  {
  factory $TopicChoiceCopyWith(TopicChoice value, $Res Function(TopicChoice) _then) = _$TopicChoiceCopyWithImpl;
@useResult
$Res call({
 String id, String title, String roadmapTitle
});




}
/// @nodoc
class _$TopicChoiceCopyWithImpl<$Res>
    implements $TopicChoiceCopyWith<$Res> {
  _$TopicChoiceCopyWithImpl(this._self, this._then);

  final TopicChoice _self;
  final $Res Function(TopicChoice) _then;

/// Create a copy of TopicChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? roadmapTitle = null,}) {
  return _then(TopicChoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roadmapTitle: null == roadmapTitle ? _self.roadmapTitle : roadmapTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicChoice].
extension TopicChoicePatterns on TopicChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicChoice value)  $default,){
final _that = this;
switch (_that) {
case _TopicChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicChoice value)?  $default,){
final _that = this;
switch (_that) {
case _TopicChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String roadmapTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicChoice() when $default != null:
return $default(_that.id,_that.title,_that.roadmapTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String roadmapTitle)  $default,) {final _that = this;
switch (_that) {
case _TopicChoice():
return $default(_that.id,_that.title,_that.roadmapTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String roadmapTitle)?  $default,) {final _that = this;
switch (_that) {
case _TopicChoice() when $default != null:
return $default(_that.id,_that.title,_that.roadmapTitle);case _:
  return null;

}
}

}

/// @nodoc


class _TopicChoice implements TopicChoice {
  const _TopicChoice({required this.id, required this.title, required this.roadmapTitle});
  

@override final  String id;
@override final  String title;
@override final  String roadmapTitle;

/// Create a copy of TopicChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicChoiceCopyWith<_TopicChoice> get copyWith => __$TopicChoiceCopyWithImpl<_TopicChoice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicChoice&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.roadmapTitle, roadmapTitle) || other.roadmapTitle == roadmapTitle));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,roadmapTitle);
}

@override
String toString() {
    return 'TopicChoice(id: $id, title: $title, roadmapTitle: $roadmapTitle)';
}


}

/// @nodoc
abstract mixin class _$TopicChoiceCopyWith<$Res> implements $TopicChoiceCopyWith<$Res> {
  factory _$TopicChoiceCopyWith(_TopicChoice value, $Res Function(_TopicChoice) _then) = __$TopicChoiceCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String roadmapTitle
});




}
/// @nodoc
class __$TopicChoiceCopyWithImpl<$Res>
    implements _$TopicChoiceCopyWith<$Res> {
  __$TopicChoiceCopyWithImpl(this._self, this._then);

  final _TopicChoice _self;
  final $Res Function(_TopicChoice) _then;

/// Create a copy of TopicChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? roadmapTitle = null,}) {
  return _then(_TopicChoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roadmapTitle: null == roadmapTitle ? _self.roadmapTitle : roadmapTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
