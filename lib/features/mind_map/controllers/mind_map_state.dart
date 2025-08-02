import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/api/api.dart';

part 'mind_map_state.freezed.dart';

@freezed
abstract class MindMapState with _$MindMapState {
  const factory MindMapState({
    required String treeId,
    required List<TreeNode> tree,
    @Default(AsyncValue<bool>.data(false)) AsyncValue<bool> saveTreeResult,
  }) = _MindMapState;
}
