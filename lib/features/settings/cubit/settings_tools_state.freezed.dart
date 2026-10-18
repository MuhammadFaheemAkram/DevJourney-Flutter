// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_tools_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsToolsState {

/// Asking for permission or (re)scheduling.
 bool get reminderBusy;/// The last attempt to turn the reminder on was refused: Settings says
/// where to allow notifications.
 bool get notificationsDenied; DataAction? get running; bool get simulatesNetworkFailure; bool get publishesCatalogUpdate; String? get message; int get messageSerial;
/// Create a copy of SettingsToolsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsToolsStateCopyWith<SettingsToolsState> get copyWith => _$SettingsToolsStateCopyWithImpl<SettingsToolsState>(this as SettingsToolsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettingsToolsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsToolsState&&(identical(other.reminderBusy, _this.reminderBusy) || other.reminderBusy == _this.reminderBusy)&&(identical(other.notificationsDenied, _this.notificationsDenied) || other.notificationsDenied == _this.notificationsDenied)&&(identical(other.running, _this.running) || other.running == _this.running)&&(identical(other.simulatesNetworkFailure, _this.simulatesNetworkFailure) || other.simulatesNetworkFailure == _this.simulatesNetworkFailure)&&(identical(other.publishesCatalogUpdate, _this.publishesCatalogUpdate) || other.publishesCatalogUpdate == _this.publishesCatalogUpdate)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.messageSerial, _this.messageSerial) || other.messageSerial == _this.messageSerial));
}


@override
int get hashCode {
  final _this = this as SettingsToolsState;
  return Object.hash(runtimeType,_this.reminderBusy,_this.notificationsDenied,_this.running,_this.simulatesNetworkFailure,_this.publishesCatalogUpdate,_this.message,_this.messageSerial);
}

@override
String toString() {
  final _this = this as SettingsToolsState;
  return 'SettingsToolsState(reminderBusy: ${_this.reminderBusy}, notificationsDenied: ${_this.notificationsDenied}, running: ${_this.running}, simulatesNetworkFailure: ${_this.simulatesNetworkFailure}, publishesCatalogUpdate: ${_this.publishesCatalogUpdate}, message: ${_this.message}, messageSerial: ${_this.messageSerial})';
}


}

/// @nodoc
abstract mixin class $SettingsToolsStateCopyWith<$Res>  {
  factory $SettingsToolsStateCopyWith(SettingsToolsState value, $Res Function(SettingsToolsState) _then) = _$SettingsToolsStateCopyWithImpl;
@useResult
$Res call({
 bool reminderBusy, bool notificationsDenied, DataAction? running, bool simulatesNetworkFailure, bool publishesCatalogUpdate, String? message, int messageSerial
});




}
/// @nodoc
class _$SettingsToolsStateCopyWithImpl<$Res>
    implements $SettingsToolsStateCopyWith<$Res> {
  _$SettingsToolsStateCopyWithImpl(this._self, this._then);

  final SettingsToolsState _self;
  final $Res Function(SettingsToolsState) _then;

/// Create a copy of SettingsToolsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reminderBusy = null,Object? notificationsDenied = null,Object? running = freezed,Object? simulatesNetworkFailure = null,Object? publishesCatalogUpdate = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(SettingsToolsState(
reminderBusy: null == reminderBusy ? _self.reminderBusy : reminderBusy // ignore: cast_nullable_to_non_nullable
as bool,notificationsDenied: null == notificationsDenied ? _self.notificationsDenied : notificationsDenied // ignore: cast_nullable_to_non_nullable
as bool,running: freezed == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as DataAction?,simulatesNetworkFailure: null == simulatesNetworkFailure ? _self.simulatesNetworkFailure : simulatesNetworkFailure // ignore: cast_nullable_to_non_nullable
as bool,publishesCatalogUpdate: null == publishesCatalogUpdate ? _self.publishesCatalogUpdate : publishesCatalogUpdate // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsToolsState].
extension SettingsToolsStatePatterns on SettingsToolsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsToolsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsToolsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsToolsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsToolsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsToolsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsToolsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool reminderBusy,  bool notificationsDenied,  DataAction? running,  bool simulatesNetworkFailure,  bool publishesCatalogUpdate,  String? message,  int messageSerial)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsToolsState() when $default != null:
return $default(_that.reminderBusy,_that.notificationsDenied,_that.running,_that.simulatesNetworkFailure,_that.publishesCatalogUpdate,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool reminderBusy,  bool notificationsDenied,  DataAction? running,  bool simulatesNetworkFailure,  bool publishesCatalogUpdate,  String? message,  int messageSerial)  $default,) {final _that = this;
switch (_that) {
case _SettingsToolsState():
return $default(_that.reminderBusy,_that.notificationsDenied,_that.running,_that.simulatesNetworkFailure,_that.publishesCatalogUpdate,_that.message,_that.messageSerial);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool reminderBusy,  bool notificationsDenied,  DataAction? running,  bool simulatesNetworkFailure,  bool publishesCatalogUpdate,  String? message,  int messageSerial)?  $default,) {final _that = this;
switch (_that) {
case _SettingsToolsState() when $default != null:
return $default(_that.reminderBusy,_that.notificationsDenied,_that.running,_that.simulatesNetworkFailure,_that.publishesCatalogUpdate,_that.message,_that.messageSerial);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsToolsState implements SettingsToolsState {
  const _SettingsToolsState({this.reminderBusy = false, this.notificationsDenied = false, this.running, this.simulatesNetworkFailure = false, this.publishesCatalogUpdate = false, this.message, this.messageSerial = 0});
  

/// Asking for permission or (re)scheduling.
@override@JsonKey() final  bool reminderBusy;
/// The last attempt to turn the reminder on was refused: Settings says
/// where to allow notifications.
@override@JsonKey() final  bool notificationsDenied;
@override final  DataAction? running;
@override@JsonKey() final  bool simulatesNetworkFailure;
@override@JsonKey() final  bool publishesCatalogUpdate;
@override final  String? message;
@override@JsonKey() final  int messageSerial;

/// Create a copy of SettingsToolsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsToolsStateCopyWith<_SettingsToolsState> get copyWith => __$SettingsToolsStateCopyWithImpl<_SettingsToolsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsToolsState&&(identical(other.reminderBusy, reminderBusy) || other.reminderBusy == reminderBusy)&&(identical(other.notificationsDenied, notificationsDenied) || other.notificationsDenied == notificationsDenied)&&(identical(other.running, running) || other.running == running)&&(identical(other.simulatesNetworkFailure, simulatesNetworkFailure) || other.simulatesNetworkFailure == simulatesNetworkFailure)&&(identical(other.publishesCatalogUpdate, publishesCatalogUpdate) || other.publishesCatalogUpdate == publishesCatalogUpdate)&&(identical(other.message, message) || other.message == message)&&(identical(other.messageSerial, messageSerial) || other.messageSerial == messageSerial));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reminderBusy,notificationsDenied,running,simulatesNetworkFailure,publishesCatalogUpdate,message,messageSerial);
}

@override
String toString() {
    return 'SettingsToolsState(reminderBusy: $reminderBusy, notificationsDenied: $notificationsDenied, running: $running, simulatesNetworkFailure: $simulatesNetworkFailure, publishesCatalogUpdate: $publishesCatalogUpdate, message: $message, messageSerial: $messageSerial)';
}


}

/// @nodoc
abstract mixin class _$SettingsToolsStateCopyWith<$Res> implements $SettingsToolsStateCopyWith<$Res> {
  factory _$SettingsToolsStateCopyWith(_SettingsToolsState value, $Res Function(_SettingsToolsState) _then) = __$SettingsToolsStateCopyWithImpl;
@override @useResult
$Res call({
 bool reminderBusy, bool notificationsDenied, DataAction? running, bool simulatesNetworkFailure, bool publishesCatalogUpdate, String? message, int messageSerial
});




}
/// @nodoc
class __$SettingsToolsStateCopyWithImpl<$Res>
    implements _$SettingsToolsStateCopyWith<$Res> {
  __$SettingsToolsStateCopyWithImpl(this._self, this._then);

  final _SettingsToolsState _self;
  final $Res Function(_SettingsToolsState) _then;

/// Create a copy of SettingsToolsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reminderBusy = null,Object? notificationsDenied = null,Object? running = freezed,Object? simulatesNetworkFailure = null,Object? publishesCatalogUpdate = null,Object? message = freezed,Object? messageSerial = null,}) {
  return _then(_SettingsToolsState(
reminderBusy: null == reminderBusy ? _self.reminderBusy : reminderBusy // ignore: cast_nullable_to_non_nullable
as bool,notificationsDenied: null == notificationsDenied ? _self.notificationsDenied : notificationsDenied // ignore: cast_nullable_to_non_nullable
as bool,running: freezed == running ? _self.running : running // ignore: cast_nullable_to_non_nullable
as DataAction?,simulatesNetworkFailure: null == simulatesNetworkFailure ? _self.simulatesNetworkFailure : simulatesNetworkFailure // ignore: cast_nullable_to_non_nullable
as bool,publishesCatalogUpdate: null == publishesCatalogUpdate ? _self.publishesCatalogUpdate : publishesCatalogUpdate // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,messageSerial: null == messageSerial ? _self.messageSerial : messageSerial // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
