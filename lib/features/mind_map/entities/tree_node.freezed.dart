// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreeNode implements DiagnosticableTreeMixin {

 String get id; String get title; String? get parentId; List<String> get childrenId;
/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<TreeNode> get copyWith => _$TreeNodeCopyWithImpl<TreeNode>(this as TreeNode, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TreeNode'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('childrenId', childrenId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&const DeepCollectionEquality().equals(other.childrenId, childrenId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,parentId,const DeepCollectionEquality().hash(childrenId));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TreeNode(id: $id, title: $title, parentId: $parentId, childrenId: $childrenId)';
}


}

/// @nodoc
abstract mixin class $TreeNodeCopyWith<$Res>  {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) _then) = _$TreeNodeCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? parentId, List<String> childrenId
});




}
/// @nodoc
class _$TreeNodeCopyWithImpl<$Res>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._self, this._then);

  final TreeNode _self;
  final $Res Function(TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? parentId = freezed,Object? childrenId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,childrenId: null == childrenId ? _self.childrenId : childrenId // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _TreeNode with DiagnosticableTreeMixin implements TreeNode {
  const _TreeNode({required this.id, required this.title, required this.parentId, final  List<String> childrenId = const []}): _childrenId = childrenId;
  

@override final  String id;
@override final  String title;
@override final  String? parentId;
 final  List<String> _childrenId;
@override@JsonKey() List<String> get childrenId {
  if (_childrenId is EqualUnmodifiableListView) return _childrenId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_childrenId);
}


/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeCopyWith<_TreeNode> get copyWith => __$TreeNodeCopyWithImpl<_TreeNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TreeNode'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('parentId', parentId))..add(DiagnosticsProperty('childrenId', childrenId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNode&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&const DeepCollectionEquality().equals(other._childrenId, _childrenId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,parentId,const DeepCollectionEquality().hash(_childrenId));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TreeNode(id: $id, title: $title, parentId: $parentId, childrenId: $childrenId)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeCopyWith<$Res> implements $TreeNodeCopyWith<$Res> {
  factory _$TreeNodeCopyWith(_TreeNode value, $Res Function(_TreeNode) _then) = __$TreeNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? parentId, List<String> childrenId
});




}
/// @nodoc
class __$TreeNodeCopyWithImpl<$Res>
    implements _$TreeNodeCopyWith<$Res> {
  __$TreeNodeCopyWithImpl(this._self, this._then);

  final _TreeNode _self;
  final $Res Function(_TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? parentId = freezed,Object? childrenId = null,}) {
  return _then(_TreeNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,childrenId: null == childrenId ? _self._childrenId : childrenId // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
