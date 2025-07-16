import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idea_maker/features/mind_map/entities/entities.dart';

part 'mind_map_state.freezed.dart';

@freezed
abstract class MindMapState with _$MindMapState {
  const factory MindMapState({required List<TreeNode> tree}) = _MindMapState;
}
