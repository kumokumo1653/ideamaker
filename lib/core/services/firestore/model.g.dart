// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  mindMaps: (json['mind_maps'] as List<dynamic>)
      .map((e) => MindMap.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'mind_maps': instance.mindMaps.map((e) => e.toJson()).toList(),
};

_MindMap _$MindMapFromJson(Map<String, dynamic> json) => _MindMap(
  id: json['id'] as String,
  tree: (json['tree'] as List<dynamic>)
      .map((e) => TreeNode.fromJson(e as Map<String, dynamic>))
      .toList(),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MindMapToJson(_MindMap instance) => <String, dynamic>{
  'id': instance.id,
  'tree': instance.tree.map((e) => e.toJson()).toList(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
