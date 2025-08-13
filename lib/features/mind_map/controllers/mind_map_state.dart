import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idea_maker/core/entities/entities.dart';

part 'mind_map_state.freezed.dart';

@freezed
abstract class MindMapState with _$MindMapState {
  const factory MindMapState({
    required String treeId,
    required List<TreeNode> tree,
    @Default(false) bool saveTreeResult,
  }) = _MindMapState;
}
