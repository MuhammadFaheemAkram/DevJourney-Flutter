// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettings {

/// Whether the user has left Welcome: the catalog is stored and a
/// roadmap was chosen.
 bool get onboarded;/// The roadmap the Dashboard follows.
 String? get activeRoadmapId;/// The version of the last catalog synced (0 before the first sync).
 int get catalogVersion; AppThemeMode get themeMode;/// Colors from the wallpaper (Android 12+). On by default, as Material
/// You apps are; ignored where the device has none.
 bool get dynamicColor;/// Reads "on" only while notifications are allowed: the reminder use
/// cases turn it off if permission is denied or later revoked.
 bool get reminderEnabled; ReminderTime get reminderTime;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AppSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.onboarded, _this.onboarded) || other.onboarded == _this.onboarded)&&(identical(other.activeRoadmapId, _this.activeRoadmapId) || other.activeRoadmapId == _this.activeRoadmapId)&&(identical(other.catalogVersion, _this.catalogVersion) || other.catalogVersion == _this.catalogVersion)&&(identical(other.themeMode, _this.themeMode) || other.themeMode == _this.themeMode)&&(identical(other.dynamicColor, _this.dynamicColor) || other.dynamicColor == _this.dynamicColor)&&(identical(other.reminderEnabled, _this.reminderEnabled) || other.reminderEnabled == _this.reminderEnabled)&&(identical(other.reminderTime, _this.reminderTime) || other.reminderTime == _this.reminderTime));
}


@override
int get hashCode {
  final _this = this as AppSettings;
  return Object.hash(runtimeType,_this.onboarded,_this.activeRoadmapId,_this.catalogVersion,_this.themeMode,_this.dynamicColor,_this.reminderEnabled,_this.reminderTime);
}

@override
String toString() {
  final _this = this as AppSettings;
  return 'AppSettings(onboarded: ${_this.onboarded}, activeRoadmapId: ${_this.activeRoadmapId}, catalogVersion: ${_this.catalogVersion}, themeMode: ${_this.themeMode}, dynamicColor: ${_this.dynamicColor}, reminderEnabled: ${_this.reminderEnabled}, reminderTime: ${_this.reminderTime})';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 bool onboarded, String? activeRoadmapId, int catalogVersion, AppThemeMode themeMode, bool dynamicColor, bool reminderEnabled, ReminderTime reminderTime
});


$ReminderTimeCopyWith<$Res> get reminderTime;

}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onboarded = null,Object? activeRoadmapId = freezed,Object? catalogVersion = null,Object? themeMode = null,Object? dynamicColor = null,Object? reminderEnabled = null,Object? reminderTime = null,}) {
  return _then(AppSettings(
onboarded: null == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool,activeRoadmapId: freezed == activeRoadmapId ? _self.activeRoadmapId : activeRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,dynamicColor: null == dynamicColor ? _self.dynamicColor : dynamicColor // ignore: cast_nullable_to_non_nullable
as bool,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: null == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as ReminderTime,
  ));
}
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<$Res> get reminderTime {
  
  return $ReminderTimeCopyWith<$Res>(_self.reminderTime, (value) {
    return _then(_self.copyWith(reminderTime: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool onboarded,  String? activeRoadmapId,  int catalogVersion,  AppThemeMode themeMode,  bool dynamicColor,  bool reminderEnabled,  ReminderTime reminderTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.onboarded,_that.activeRoadmapId,_that.catalogVersion,_that.themeMode,_that.dynamicColor,_that.reminderEnabled,_that.reminderTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool onboarded,  String? activeRoadmapId,  int catalogVersion,  AppThemeMode themeMode,  bool dynamicColor,  bool reminderEnabled,  ReminderTime reminderTime)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.onboarded,_that.activeRoadmapId,_that.catalogVersion,_that.themeMode,_that.dynamicColor,_that.reminderEnabled,_that.reminderTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool onboarded,  String? activeRoadmapId,  int catalogVersion,  AppThemeMode themeMode,  bool dynamicColor,  bool reminderEnabled,  ReminderTime reminderTime)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.onboarded,_that.activeRoadmapId,_that.catalogVersion,_that.themeMode,_that.dynamicColor,_that.reminderEnabled,_that.reminderTime);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettings implements AppSettings {
  const _AppSettings({this.onboarded = false, this.activeRoadmapId, this.catalogVersion = 0, this.themeMode = AppThemeMode.system, this.dynamicColor = true, this.reminderEnabled = false, this.reminderTime = ReminderTime.evening});
  

/// Whether the user has left Welcome: the catalog is stored and a
/// roadmap was chosen.
@override@JsonKey() final  bool onboarded;
/// The roadmap the Dashboard follows.
@override final  String? activeRoadmapId;
/// The version of the last catalog synced (0 before the first sync).
@override@JsonKey() final  int catalogVersion;
@override@JsonKey() final  AppThemeMode themeMode;
/// Colors from the wallpaper (Android 12+). On by default, as Material
/// You apps are; ignored where the device has none.
@override@JsonKey() final  bool dynamicColor;
/// Reads "on" only while notifications are allowed: the reminder use
/// cases turn it off if permission is denied or later revoked.
@override@JsonKey() final  bool reminderEnabled;
@override@JsonKey() final  ReminderTime reminderTime;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded)&&(identical(other.activeRoadmapId, activeRoadmapId) || other.activeRoadmapId == activeRoadmapId)&&(identical(other.catalogVersion, catalogVersion) || other.catalogVersion == catalogVersion)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.dynamicColor, dynamicColor) || other.dynamicColor == dynamicColor)&&(identical(other.reminderEnabled, reminderEnabled) || other.reminderEnabled == reminderEnabled)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime));
}


@override
int get hashCode {
    return Object.hash(runtimeType,onboarded,activeRoadmapId,catalogVersion,themeMode,dynamicColor,reminderEnabled,reminderTime);
}

@override
String toString() {
    return 'AppSettings(onboarded: $onboarded, activeRoadmapId: $activeRoadmapId, catalogVersion: $catalogVersion, themeMode: $themeMode, dynamicColor: $dynamicColor, reminderEnabled: $reminderEnabled, reminderTime: $reminderTime)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool onboarded, String? activeRoadmapId, int catalogVersion, AppThemeMode themeMode, bool dynamicColor, bool reminderEnabled, ReminderTime reminderTime
});


@override $ReminderTimeCopyWith<$Res> get reminderTime;

}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onboarded = null,Object? activeRoadmapId = freezed,Object? catalogVersion = null,Object? themeMode = null,Object? dynamicColor = null,Object? reminderEnabled = null,Object? reminderTime = null,}) {
  return _then(_AppSettings(
onboarded: null == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool,activeRoadmapId: freezed == activeRoadmapId ? _self.activeRoadmapId : activeRoadmapId // ignore: cast_nullable_to_non_nullable
as String?,catalogVersion: null == catalogVersion ? _self.catalogVersion : catalogVersion // ignore: cast_nullable_to_non_nullable
as int,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,dynamicColor: null == dynamicColor ? _self.dynamicColor : dynamicColor // ignore: cast_nullable_to_non_nullable
as bool,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: null == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as ReminderTime,
  ));
}

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTimeCopyWith<$Res> get reminderTime {
  
  return $ReminderTimeCopyWith<$Res>(_self.reminderTime, (value) {
    return _then(_self.copyWith(reminderTime: value));
  });
}
}

// dart format on
