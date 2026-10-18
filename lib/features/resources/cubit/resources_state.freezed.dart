// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resources_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResourcesState {

 ResourcesStatus get status; List<ResourceItem> get resources; String get query;/// `null`: every type.
 ResourceType? get type; bool get savedOnly; String? get message; int get messageSerial;
/// Create a copy of ResourcesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourcesStateCopyWith<ResourcesState> get copyWith => _$ResourcesStateCopyWithImpl<ResourcesState>(this as ResourcesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ResourcesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourcesState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.resources, _this.resources)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.savedOnly, _this.savedOnly) || other.savedOnly == _this.savedOnly)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as ResourcesState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.resources),_this.query,_this.type,_this.savedOnly,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as ResourcesState;
  return 'ResourcesState(status: ${_this.status}, resources: ${_this.resources}, query: ${_this.query}, type: ${_this.type}, savedOnly: ${_this.savedOnly}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $ResourcesStateCopyWith<$Res>  {
  factory $ResourcesStateCopyWith(ResourcesState value, $Res Function(ResourcesState) _then) = _$ResourcesStateCopyWithImpl;
@useResult
$Res call({
 ResourcesStatus status, List<ResourceItem> resources, String query, ResourceType? type, bool savedOnly, String? message, int messageSerial
});




}
/// @nodoc
class _$ResourcesStateCopyWithImpl<$Res>
    implements $ResourcesStateCopyWith<$Res> {
  _$ResourcesStateCopyWithImpl(this._self, this._then);

  final ResourcesState _self;
  final $Res Function(ResourcesState) _then;

/// Create a copy of ResourcesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? resources = null,Object? query = null,Object? type = freezed,Object? savedOnly = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(ResourcesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResourcesStatus,resources: null == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType?,savedOnly: null == savedOnly ? _self.savedOnly : savedOnly // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourcesState].
extension ResourcesStatePatterns on ResourcesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourcesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourcesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourcesState value)  $default,){
final _that = this;
switch (_that) {
case _ResourcesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourcesState value)?  $default,){
final _that = this;
switch (_that) {
case _ResourcesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ResourcesStatus status,  List<ResourceItem> resources,  String query,  ResourceType? type,  bool savedOnly,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourcesState() when $default != null:
return $default(_that.status,_that.resources,_that.query,_that.type,_that.savedOnly,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ResourcesStatus status,  List<ResourceItem> resources,  String query,  ResourceType? type,  bool savedOnly,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _ResourcesState():
return $default(_that.status,_that.resources,_that.query,_that.type,_that.savedOnly,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ResourcesStatus status,  List<ResourceItem> resources,  String query,  ResourceType? type,  bool savedOnly,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _ResourcesState() when $default != null:
return $default(_that.status,_that.resources,_that.query,_that.type,_that.savedOnly,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _ResourcesState extends ResourcesState {
  const _ResourcesState({this.status = ResourcesStatus.loading,  List<ResourceItem> resources = const <ResourceItem>[], this.query = '', this.type, this.savedOnly = false, this.message, this.messageSerial = 0}): _resources = resources,super._();
  

@override@JsonKey() final  ResourcesStatus status;
 final  List<ResourceItem> _resources;
@override@JsonKey() List<ResourceItem> get resources {
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resources);
}

@override@JsonKey() final  String query;
/// `null`: every type.
@override final  ResourceType? type;
@override@JsonKey() final  bool savedOnly;
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of ResourcesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourcesStateCopyWith<_ResourcesState> get copyWith => __$ResourcesStateCopyWithImpl<_ResourcesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourcesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.resources, _resources)&&(identical(other.query, query) || other.query == query)&&(identical(other.type, type) || other.type == type)&&(identical(other.savedOnly, savedOnly) || other.savedOnly == savedOnly)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_resources),query,type,savedOnly,message,messageSerial);
}

@override
String toString() {
    return 'ResourcesState(status: $status, resources: $resources, query: $query, type: $type, savedOnly: $savedOnly, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$ResourcesStateCopyWith<$Res> implements $ResourcesStateCopyWith<$Res> {
  factory _$ResourcesStateCopyWith(_ResourcesState value, $Res Function(_ResourcesState) _then) = __$ResourcesStateCopyWithImpl;
@override @useResult
$Res call({
 ResourcesStatus status, List<ResourceItem> resources, String query, ResourceType? type, bool savedOnly, String? message, int messageSerial
});




}
/// @nodoc
class __$ResourcesStateCopyWithImpl<$Res>
    implements _$ResourcesStateCopyWith<$Res> {
  __$ResourcesStateCopyWithImpl(this._self, this._then);

  final _ResourcesState _self;
  final $Res Function(_ResourcesState) _then;

/// Create a copy of ResourcesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? resources = null,Object? query = null,Object? type = freezed,Object? savedOnly = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_ResourcesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ResourcesStatus,resources: null == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<ResourceItem>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ResourceType?,savedOnly: null == savedOnly ? _self.savedOnly : savedOnly // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
