// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) => _TreeNode(
  id: json['id'] as String,
  title: json['title'] as String,
  parentId: json['parent_id'] as String?,
  childrenId:
      (json['children_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$TreeNodeToJson(_TreeNode instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'parent_id': instance.parentId,
  'children_id': instance.childrenId,
};
