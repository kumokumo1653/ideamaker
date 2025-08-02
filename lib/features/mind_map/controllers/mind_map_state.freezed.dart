// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mind_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MindMapState {

 String get treeId; List<TreeNode> get tree; bool get saveTreeResult;
/// Create a copy of MindMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MindMapStateCopyWith<MindMapState> get copyWith => _$MindMapStateCopyWithImpl<MindMapState>(this as MindMapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MindMapState&&(identical(other.treeId, treeId) || other.treeId == treeId)&&const DeepCollectionEquality().equals(other.tree, tree)&&(identical(other.saveTreeResult, saveTreeResult) || other.saveTreeResult == saveTreeResult));
}


@override
int get hashCode => Object.hash(runtimeType,treeId,const DeepCollectionEquality().hash(tree),saveTreeResult);

@override
String toString() {
  return 'MindMapState(treeId: $treeId, tree: $tree, saveTreeResult: $saveTreeResult)';
}


}

/// @nodoc
abstract mixin class $MindMapStateCopyWith<$Res>  {
  factory $MindMapStateCopyWith(MindMapState value, $Res Function(MindMapState) _then) = _$MindMapStateCopyWithImpl;
@useResult
$Res call({
 String treeId, List<TreeNode> tree, bool saveTreeResult
});




}
/// @nodoc
class _$MindMapStateCopyWithImpl<$Res>
    implements $MindMapStateCopyWith<$Res> {
  _$MindMapStateCopyWithImpl(this._self, this._then);

  final MindMapState _self;
  final $Res Function(MindMapState) _then;

/// Create a copy of MindMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? treeId = null,Object? tree = null,Object? saveTreeResult = null,}) {
  return _then(_self.copyWith(
treeId: null == treeId ? _self.treeId : treeId // ignore: cast_nullable_to_non_nullable
as String,tree: null == tree ? _self.tree : tree // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,saveTreeResult: null == saveTreeResult ? _self.saveTreeResult : saveTreeResult // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MindMapState implements MindMapState {
  const _MindMapState({required this.treeId, required final  List<TreeNode> tree, this.saveTreeResult = false}): _tree = tree;
  

@override final  String treeId;
 final  List<TreeNode> _tree;
@override List<TreeNode> get tree {
  if (_tree is EqualUnmodifiableListView) return _tree;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tree);
}

@override@JsonKey() final  bool saveTreeResult;

/// Create a copy of MindMapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MindMapStateCopyWith<_MindMapState> get copyWith => __$MindMapStateCopyWithImpl<_MindMapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MindMapState&&(identical(other.treeId, treeId) || other.treeId == treeId)&&const DeepCollectionEquality().equals(other._tree, _tree)&&(identical(other.saveTreeResult, saveTreeResult) || other.saveTreeResult == saveTreeResult));
}


@override
int get hashCode => Object.hash(runtimeType,treeId,const DeepCollectionEquality().hash(_tree),saveTreeResult);

@override
String toString() {
  return 'MindMapState(treeId: $treeId, tree: $tree, saveTreeResult: $saveTreeResult)';
}


}

/// @nodoc
abstract mixin class _$MindMapStateCopyWith<$Res> implements $MindMapStateCopyWith<$Res> {
  factory _$MindMapStateCopyWith(_MindMapState value, $Res Function(_MindMapState) _then) = __$MindMapStateCopyWithImpl;
@override @useResult
$Res call({
 String treeId, List<TreeNode> tree, bool saveTreeResult
});




}
/// @nodoc
class __$MindMapStateCopyWithImpl<$Res>
    implements _$MindMapStateCopyWith<$Res> {
  __$MindMapStateCopyWithImpl(this._self, this._then);

  final _MindMapState _self;
  final $Res Function(_MindMapState) _then;

/// Create a copy of MindMapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? treeId = null,Object? tree = null,Object? saveTreeResult = null,}) {
  return _then(_MindMapState(
treeId: null == treeId ? _self.treeId : treeId // ignore: cast_nullable_to_non_nullable
as String,tree: null == tree ? _self._tree : tree // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,saveTreeResult: null == saveTreeResult ? _self.saveTreeResult : saveTreeResult // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
