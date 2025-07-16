import 'package:collection/collection.dart';
import 'package:idea_maker/features/mind_map/controllers/mind_map_state.dart';
import 'package:idea_maker/features/mind_map/entities/tree_node.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'mind_map_controller.g.dart';

@riverpod
class MindMapController extends _$MindMapController {
  @override
  MindMapState build() => MindMapState(
    tree: [
      TreeNode(
        id: const Uuid().v4(),
        title: '', //TODO: placeholder for title
        parentId: null,
      ),
    ],
  );

  void changeTitle(String id, String title) {
    final node = state.tree.firstWhereOrNull((e) => e.id == id);
    if (node != null) {
      final updatedNode = node.copyWith(title: title);
      final updatedTree = state.tree
          .map((e) => e.id == id ? updatedNode : e)
          .toList();
      state = state.copyWith(tree: updatedTree);
    } else {
      throw Exception('Node with id $id not found');
    }
  }

  void addNode(String? parentId) {
    final node = TreeNode(
      id: const Uuid().v4(),
      title: '', //TODO: placeholder for title
      parentId: parentId,
    );
    if (parentId == null) {
      // [parentId] is null, so we add the node as a root node
      state = state.copyWith(tree: [node]);
      return;
    } else {
      // [parentId] is not null,
      // so we find the parent node and add the new node as a child
      final parentNode = state.tree.firstWhereOrNull((e) => e.id == parentId);
      if (parentNode != null) {
        final updatedChildren = [...parentNode.childrenId, node.id];
        final updatedParent = parentNode.copyWith(childrenId: updatedChildren);
        final updatedTree = [
          ...state.tree.map((e) => e.id == parentId ? updatedParent : e),
          node,
        ];
        state = state.copyWith(tree: updatedTree);
      } else {
        throw Exception('Parent node with id $parentId not found');
      }
    }
  }
}
