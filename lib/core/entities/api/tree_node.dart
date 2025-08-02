import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';
part 'tree_node.g.dart';

@freezed
abstract class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    required String title,
    required String? parentId,
    @Default([]) List<String> childrenId,
  }) = _TreeNode;

  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
}
