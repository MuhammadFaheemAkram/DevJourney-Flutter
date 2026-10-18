// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HighlightedText {

 String get text;/// `[start, end)` character offsets into [text], in order, not
/// overlapping.
 List<(int, int,)> get matches;
/// Create a copy of HighlightedText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HighlightedTextCopyWith<HighlightedText> get copyWith => _$HighlightedTextCopyWithImpl<HighlightedText>(this as HighlightedText, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HighlightedText;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighlightedText&&(identical(other.text, _this.text) || other.text == _this.text)&&const DeepCollectionEquality().equals(other.matches, _this.matches));
}


@override
int get hashCode {
  final _this = this as HighlightedText;
  return Object.hash(runtimeType,_this.text,const DeepCollectionEquality().hash(_this.matches));
}

@override
String toString() {
  final _this = this as HighlightedText;
  return 'HighlightedText(text: ${_this.text}, matches: ${_this.matches})';
}


}

/// @nodoc
abstract mixin class $HighlightedTextCopyWith<$Res>  {
  factory $HighlightedTextCopyWith(HighlightedText value, $Res Function(HighlightedText) _then) = _$HighlightedTextCopyWithImpl;
@useResult
$Res call({
 String text, List<(int, int,)> matches
});




}
/// @nodoc
class _$HighlightedTextCopyWithImpl<$Res>
    implements $HighlightedTextCopyWith<$Res> {
  _$HighlightedTextCopyWithImpl(this._self, this._then);

  final HighlightedText _self;
  final $Res Function(HighlightedText) _then;

/// Create a copy of HighlightedText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? matches = null,}) {
  return _then(HighlightedText(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<(int, int,)>,
  ));
}

}


/// Adds pattern-matching-related methods to [HighlightedText].
extension HighlightedTextPatterns on HighlightedText {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HighlightedText value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HighlightedText() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HighlightedText value)  $default,){
final _that = this;
switch (_that) {
case _HighlightedText():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HighlightedText value)?  $default,){
final _that = this;
switch (_that) {
case _HighlightedText() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<(int, int,)> matches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HighlightedText() when $default != null:
return $default(_that.text,_that.matches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<(int, int,)> matches)  $default,) {final _that = this;
switch (_that) {
case _HighlightedText():
return $default(_that.text,_that.matches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<(int, int,)> matches)?  $default,) {final _that = this;
switch (_that) {
case _HighlightedText() when $default != null:
return $default(_that.text,_that.matches);case _:
  return null;

}
}

}

/// @nodoc


class _HighlightedText implements HighlightedText {
  const _HighlightedText({required this.text,  List<(int, int,)> matches = const <(int, int)>[]}): _matches = matches;
  

@override final  String text;
/// `[start, end)` character offsets into [text], in order, not
/// overlapping.
 final  List<(int, int,)> _matches;
/// `[start, end)` character offsets into [text], in order, not
/// overlapping.
@override@JsonKey() List<(int, int,)> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}


/// Create a copy of HighlightedText
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighlightedTextCopyWith<_HighlightedText> get copyWith => __$HighlightedTextCopyWithImpl<_HighlightedText>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HighlightedText&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.matches, _matches));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_matches));
}

@override
String toString() {
    return 'HighlightedText(text: $text, matches: $matches)';
}


}

/// @nodoc
abstract mixin class _$HighlightedTextCopyWith<$Res> implements $HighlightedTextCopyWith<$Res> {
  factory _$HighlightedTextCopyWith(_HighlightedText value, $Res Function(_HighlightedText) _then) = __$HighlightedTextCopyWithImpl;
@override @useResult
$Res call({
 String text, List<(int, int,)> matches
});




}
/// @nodoc
class __$HighlightedTextCopyWithImpl<$Res>
    implements _$HighlightedTextCopyWith<$Res> {
  __$HighlightedTextCopyWithImpl(this._self, this._then);

  final _HighlightedText _self;
  final $Res Function(_HighlightedText) _then;

/// Create a copy of HighlightedText
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? matches = null,}) {
  return _then(_HighlightedText(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<(int, int,)>,
  ));
}


}

/// @nodoc
mixin _$SearchHit {

 SearchKind get kind; String get id; HighlightedText get title;/// A few words around the match in the body (a topic's description, a
/// note's text, a resource's source, a challenge's prompt).
 HighlightedText get snippet;/// bm25: lower is better.
 double get rank;
/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHitCopyWith<SearchHit> get copyWith => _$SearchHitCopyWithImpl<SearchHit>(this as SearchHit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SearchHit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHit&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.snippet, _this.snippet) || other.snippet == _this.snippet)&&(identical(other.rank, _this.rank) || other.rank == _this.rank));
}


@override
int get hashCode {
  final _this = this as SearchHit;
  return Object.hash(runtimeType,_this.kind,_this.id,_this.title,_this.snippet,_this.rank);
}

@override
String toString() {
  final _this = this as SearchHit;
  return 'SearchHit(kind: ${_this.kind}, id: ${_this.id}, title: ${_this.title}, snippet: ${_this.snippet}, rank: ${_this.rank})';
}


}

/// @nodoc
abstract mixin class $SearchHitCopyWith<$Res>  {
  factory $SearchHitCopyWith(SearchHit value, $Res Function(SearchHit) _then) = _$SearchHitCopyWithImpl;
@useResult
$Res call({
 SearchKind kind, String id, HighlightedText title, HighlightedText snippet, double rank
});


$HighlightedTextCopyWith<$Res> get title;$HighlightedTextCopyWith<$Res> get snippet;

}
/// @nodoc
class _$SearchHitCopyWithImpl<$Res>
    implements $SearchHitCopyWith<$Res> {
  _$SearchHitCopyWithImpl(this._self, this._then);

  final SearchHit _self;
  final $Res Function(SearchHit) _then;

/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,Object? title = null,Object? snippet = null,Object? rank = null,}) {
  return _then(SearchHit(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SearchKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as HighlightedText,snippet: null == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as HighlightedText,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightedTextCopyWith<$Res> get title {
  
  return $HighlightedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightedTextCopyWith<$Res> get snippet {
  
  return $HighlightedTextCopyWith<$Res>(_self.snippet, (value) {
    return _then(_self.copyWith(snippet: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchHit].
extension SearchHitPatterns on SearchHit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchHit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchHit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchHit value)  $default,){
final _that = this;
switch (_that) {
case _SearchHit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchHit value)?  $default,){
final _that = this;
switch (_that) {
case _SearchHit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchKind kind,  String id,  HighlightedText title,  HighlightedText snippet,  double rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchHit() when $default != null:
return $default(_that.kind,_that.id,_that.title,_that.snippet,_that.rank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchKind kind,  String id,  HighlightedText title,  HighlightedText snippet,  double rank)  $default,) {final _that = this;
switch (_that) {
case _SearchHit():
return $default(_that.kind,_that.id,_that.title,_that.snippet,_that.rank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchKind kind,  String id,  HighlightedText title,  HighlightedText snippet,  double rank)?  $default,) {final _that = this;
switch (_that) {
case _SearchHit() when $default != null:
return $default(_that.kind,_that.id,_that.title,_that.snippet,_that.rank);case _:
  return null;

}
}

}

/// @nodoc


class _SearchHit implements SearchHit {
  const _SearchHit({required this.kind, required this.id, required this.title, required this.snippet, required this.rank});
  

@override final  SearchKind kind;
@override final  String id;
@override final  HighlightedText title;
/// A few words around the match in the body (a topic's description, a
/// note's text, a resource's source, a challenge's prompt).
@override final  HighlightedText snippet;
/// bm25: lower is better.
@override final  double rank;

/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHitCopyWith<_SearchHit> get copyWith => __$SearchHitCopyWithImpl<_SearchHit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHit&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.snippet, snippet) || other.snippet == snippet)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,id,title,snippet,rank);
}

@override
String toString() {
    return 'SearchHit(kind: $kind, id: $id, title: $title, snippet: $snippet, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$SearchHitCopyWith<$Res> implements $SearchHitCopyWith<$Res> {
  factory _$SearchHitCopyWith(_SearchHit value, $Res Function(_SearchHit) _then) = __$SearchHitCopyWithImpl;
@override @useResult
$Res call({
 SearchKind kind, String id, HighlightedText title, HighlightedText snippet, double rank
});


@override $HighlightedTextCopyWith<$Res> get title;@override $HighlightedTextCopyWith<$Res> get snippet;

}
/// @nodoc
class __$SearchHitCopyWithImpl<$Res>
    implements _$SearchHitCopyWith<$Res> {
  __$SearchHitCopyWithImpl(this._self, this._then);

  final _SearchHit _self;
  final $Res Function(_SearchHit) _then;

/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,Object? title = null,Object? snippet = null,Object? rank = null,}) {
  return _then(_SearchHit(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SearchKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as HighlightedText,snippet: null == snippet ? _self.snippet : snippet // ignore: cast_nullable_to_non_nullable
as HighlightedText,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightedTextCopyWith<$Res> get title {
  
  return $HighlightedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of SearchHit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HighlightedTextCopyWith<$Res> get snippet {
  
  return $HighlightedTextCopyWith<$Res>(_self.snippet, (value) {
    return _then(_self.copyWith(snippet: value));
  });
}
}

/// @nodoc
mixin _$SearchResults {

 Map<SearchKind, List<SearchHit>> get groups;
/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<SearchResults> get copyWith => _$SearchResultsCopyWithImpl<SearchResults>(this as SearchResults, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SearchResults;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResults&&const DeepCollectionEquality().equals(other.groups, _this.groups));
}


@override
int get hashCode {
  final _this = this as SearchResults;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.groups));
}

@override
String toString() {
  final _this = this as SearchResults;
  return 'SearchResults(groups: ${_this.groups})';
}


}

/// @nodoc
abstract mixin class $SearchResultsCopyWith<$Res>  {
  factory $SearchResultsCopyWith(SearchResults value, $Res Function(SearchResults) _then) = _$SearchResultsCopyWithImpl;
@useResult
$Res call({
 Map<SearchKind, List<SearchHit>> groups
});




}
/// @nodoc
class _$SearchResultsCopyWithImpl<$Res>
    implements $SearchResultsCopyWith<$Res> {
  _$SearchResultsCopyWithImpl(this._self, this._then);

  final SearchResults _self;
  final $Res Function(SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = null,}) {
  return _then(SearchResults(
groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as Map<SearchKind, List<SearchHit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResults].
extension SearchResultsPatterns on SearchResults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResults value)  $default,){
final _that = this;
switch (_that) {
case _SearchResults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResults value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<SearchKind, List<SearchHit>> groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<SearchKind, List<SearchHit>> groups)  $default,) {final _that = this;
switch (_that) {
case _SearchResults():
return $default(_that.groups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<SearchKind, List<SearchHit>> groups)?  $default,) {final _that = this;
switch (_that) {
case _SearchResults() when $default != null:
return $default(_that.groups);case _:
  return null;

}
}

}

/// @nodoc


class _SearchResults extends SearchResults {
  const _SearchResults({ Map<SearchKind, List<SearchHit>> groups = const <SearchKind, List<SearchHit>>{}}): _groups = groups,super._();
  

 final  Map<SearchKind, List<SearchHit>> _groups;
@override@JsonKey() Map<SearchKind, List<SearchHit>> get groups {
  if (_groups is EqualUnmodifiableMapView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groups);
}


/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultsCopyWith<_SearchResults> get copyWith => __$SearchResultsCopyWithImpl<_SearchResults>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResults&&const DeepCollectionEquality().equals(other.groups, _groups));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups));
}

@override
String toString() {
    return 'SearchResults(groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$SearchResultsCopyWith<$Res> implements $SearchResultsCopyWith<$Res> {
  factory _$SearchResultsCopyWith(_SearchResults value, $Res Function(_SearchResults) _then) = __$SearchResultsCopyWithImpl;
@override @useResult
$Res call({
 Map<SearchKind, List<SearchHit>> groups
});




}
/// @nodoc
class __$SearchResultsCopyWithImpl<$Res>
    implements _$SearchResultsCopyWith<$Res> {
  __$SearchResultsCopyWithImpl(this._self, this._then);

  final _SearchResults _self;
  final $Res Function(_SearchResults) _then;

/// Create a copy of SearchResults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = null,}) {
  return _then(_SearchResults(
groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as Map<SearchKind, List<SearchHit>>,
  ));
}


}

// dart format on
