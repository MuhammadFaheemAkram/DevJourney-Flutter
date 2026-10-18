// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResourceItem {

 Resource get resource; bool get bookmarked; String? get topicTitle;
/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceItemCopyWith<ResourceItem> get copyWith => _$ResourceItemCopyWithImpl<ResourceItem>(this as ResourceItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResourceItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceItem&&(identical(other.resource, _this.resource) || other.resource == _this.resource)&&(identical(other.bookmarked, _this.bookmarked) || other.bookmarked == _this.bookmarked)&&(identical(other.topicTitle, _this.topicTitle) || other.topicTitle == _this.topicTitle));
}


@override
int get hashCode {
  final _this = this as ResourceItem;
  return Object.hash(runtimeType,_this.resource,_this.bookmarked,_this.topicTitle);
}

@override
String toString() {
  final _this = this as ResourceItem;
  return 'ResourceItem(resource: ${_this.resource}, bookmarked: ${_this.bookmarked}, topicTitle: ${_this.topicTitle})';
}


}

/// @nodoc
abstract mixin class $ResourceItemCopyWith<$Res>  {
  factory $ResourceItemCopyWith(ResourceItem value, $Res Function(ResourceItem) _then) = _$ResourceItemCopyWithImpl;
@useResult
$Res call({
 Resource resource, bool bookmarked, String? topicTitle
});


$ResourceCopyWith<$Res> get resource;

}
/// @nodoc
class _$ResourceItemCopyWithImpl<$Res>
    implements $ResourceItemCopyWith<$Res> {
  _$ResourceItemCopyWithImpl(this._self, this._then);

  final ResourceItem _self;
  final $Res Function(ResourceItem) _then;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resource = null,Object? bookmarked = null,Object? topicTitle = freezed,}) {
  return _then(ResourceItem(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as Resource,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,topicTitle: freezed == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res> get resource {
  
  return $ResourceCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResourceItem].
extension ResourceItemPatterns on ResourceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceItem value)  $default,){
final _that = this;
switch (_that) {
case _ResourceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceItem value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Resource resource,  bool bookmarked,  String? topicTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
return $default(_that.resource,_that.bookmarked,_that.topicTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Resource resource,  bool bookmarked,  String? topicTitle)  $default,) {final _that = this;
switch (_that) {
case _ResourceItem():
return $default(_that.resource,_that.bookmarked,_that.topicTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Resource resource,  bool bookmarked,  String? topicTitle)?  $default,) {final _that = this;
switch (_that) {
case _ResourceItem() when $default != null:
return $default(_that.resource,_that.bookmarked,_that.topicTitle);case _:
  return null;

}
}

}

/// @nodoc


class _ResourceItem implements ResourceItem {
  const _ResourceItem({required this.resource, this.bookmarked = false, this.topicTitle});
  

@override final  Resource resource;
@override@JsonKey() final  bool bookmarked;
@override final  String? topicTitle;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceItemCopyWith<_ResourceItem> get copyWith => __$ResourceItemCopyWithImpl<_ResourceItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceItem&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.bookmarked, bookmarked) || other.bookmarked == bookmarked)&&(identical(other.topicTitle, topicTitle) || other.topicTitle == topicTitle));
}


@override
int get hashCode {
    return Object.hash(runtimeType,resource,bookmarked,topicTitle);
}

@override
String toString() {
    return 'ResourceItem(resource: $resource, bookmarked: $bookmarked, topicTitle: $topicTitle)';
}


}

/// @nodoc
abstract mixin class _$ResourceItemCopyWith<$Res> implements $ResourceItemCopyWith<$Res> {
  factory _$ResourceItemCopyWith(_ResourceItem value, $Res Function(_ResourceItem) _then) = __$ResourceItemCopyWithImpl;
@override @useResult
$Res call({
 Resource resource, bool bookmarked, String? topicTitle
});


@override $ResourceCopyWith<$Res> get resource;

}
/// @nodoc
class __$ResourceItemCopyWithImpl<$Res>
    implements _$ResourceItemCopyWith<$Res> {
  __$ResourceItemCopyWithImpl(this._self, this._then);

  final _ResourceItem _self;
  final $Res Function(_ResourceItem) _then;

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resource = null,Object? bookmarked = null,Object? topicTitle = freezed,}) {
  return _then(_ResourceItem(
resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as Resource,bookmarked: null == bookmarked ? _self.bookmarked : bookmarked // ignore: cast_nullable_to_non_nullable
as bool,topicTitle: freezed == topicTitle ? _self.topicTitle : topicTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResourceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res> get resource {
  
  return $ResourceCopyWith<$Res>(_self.resource, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}

// dart format on
