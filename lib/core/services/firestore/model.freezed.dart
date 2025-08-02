// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@DocumentIdField() String get id; List<MindMap> get mindMaps;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.mindMaps, mindMaps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(mindMaps));

@override
String toString() {
  return 'User(id: $id, mindMaps: $mindMaps)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@DocumentIdField() String id, List<MindMap> mindMaps
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mindMaps = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mindMaps: null == mindMaps ? _self.mindMaps : mindMaps // ignore: cast_nullable_to_non_nullable
as List<MindMap>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({@DocumentIdField() required this.id, required final  List<MindMap> mindMaps}): _mindMaps = mindMaps;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@DocumentIdField() final  String id;
 final  List<MindMap> _mindMaps;
@override List<MindMap> get mindMaps {
  if (_mindMaps is EqualUnmodifiableListView) return _mindMaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mindMaps);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._mindMaps, _mindMaps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_mindMaps));

@override
String toString() {
  return 'User(id: $id, mindMaps: $mindMaps)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@DocumentIdField() String id, List<MindMap> mindMaps
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mindMaps = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mindMaps: null == mindMaps ? _self._mindMaps : mindMaps // ignore: cast_nullable_to_non_nullable
as List<MindMap>,
  ));
}


}


/// @nodoc
mixin _$MindMap {

@DocumentIdField() String get id; List<TreeNode> get tree; DateTime get updatedAt;
/// Create a copy of MindMap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MindMapCopyWith<MindMap> get copyWith => _$MindMapCopyWithImpl<MindMap>(this as MindMap, _$identity);

  /// Serializes this MindMap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MindMap&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.tree, tree)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(tree),updatedAt);

@override
String toString() {
  return 'MindMap(id: $id, tree: $tree, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MindMapCopyWith<$Res>  {
  factory $MindMapCopyWith(MindMap value, $Res Function(MindMap) _then) = _$MindMapCopyWithImpl;
@useResult
$Res call({
@DocumentIdField() String id, List<TreeNode> tree, DateTime updatedAt
});




}
/// @nodoc
class _$MindMapCopyWithImpl<$Res>
    implements $MindMapCopyWith<$Res> {
  _$MindMapCopyWithImpl(this._self, this._then);

  final MindMap _self;
  final $Res Function(MindMap) _then;

/// Create a copy of MindMap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tree = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tree: null == tree ? _self.tree : tree // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MindMap implements MindMap {
  const _MindMap({@DocumentIdField() required this.id, required final  List<TreeNode> tree, required this.updatedAt}): _tree = tree;
  factory _MindMap.fromJson(Map<String, dynamic> json) => _$MindMapFromJson(json);

@override@DocumentIdField() final  String id;
 final  List<TreeNode> _tree;
@override List<TreeNode> get tree {
  if (_tree is EqualUnmodifiableListView) return _tree;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tree);
}

@override final  DateTime updatedAt;

/// Create a copy of MindMap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MindMapCopyWith<_MindMap> get copyWith => __$MindMapCopyWithImpl<_MindMap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MindMapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MindMap&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._tree, _tree)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_tree),updatedAt);

@override
String toString() {
  return 'MindMap(id: $id, tree: $tree, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MindMapCopyWith<$Res> implements $MindMapCopyWith<$Res> {
  factory _$MindMapCopyWith(_MindMap value, $Res Function(_MindMap) _then) = __$MindMapCopyWithImpl;
@override @useResult
$Res call({
@DocumentIdField() String id, List<TreeNode> tree, DateTime updatedAt
});




}
/// @nodoc
class __$MindMapCopyWithImpl<$Res>
    implements _$MindMapCopyWith<$Res> {
  __$MindMapCopyWithImpl(this._self, this._then);

  final _MindMap _self;
  final $Res Function(_MindMap) _then;

/// Create a copy of MindMap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tree = null,Object? updatedAt = null,}) {
  return _then(_MindMap(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tree: null == tree ? _self._tree : tree // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
