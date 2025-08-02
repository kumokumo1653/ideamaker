import 'package:collection/collection.dart';
import 'package:idea_maker/core/entities/api/tree_node.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:idea_maker/features/mind_map/controllers/controllers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'mind_map_controller.g.dart';

@riverpod
class MindMapController extends _$MindMapController {
  MindMapRepository get _mindMapRepository =>
      ref.watch(mindMapRepositoryProvider);

  @override
  FutureOr<MindMapState> build(String? treeId) async {
    if (treeId != null) {
      state = const AsyncValue<MindMapState>.loading();
      final tree = await _mindMapRepository
          .fetchTree(treeId)
          .onError(
            (error, stackTrace) => throw Exception('Failed to fetch mind map'),
          );
      // if the tree is not empty, return the tree
      if (tree.isNotEmpty) {
        return MindMapState(treeId: treeId, tree: tree);
      }
    }
    return MindMapState(
      treeId: const Uuid().v4(),
      tree: [
        TreeNode(
          id: const Uuid().v4(),
          title: '', // TODO(ohike): placeholder for title
          parentId: null,
          childrenId: [],
        ),
      ],
    );
  }

  void changeTitle(String id, String title) {
    assert(!state.isLoading, 'Cannot change title while state is loading');
    final currentState = state.value;
    if (currentState == null) {
      return;
    }
    final node = currentState.tree.firstWhereOrNull((TreeNode e) => e.id == id);
    if (node != null) {
      final updatedNode = node.copyWith(title: title);
      final updatedTree = currentState.tree
          .map((TreeNode e) => e.id == id ? updatedNode : e)
          .toList();
      state = AsyncValue.data(currentState.copyWith(tree: updatedTree));
    } else {
      throw Exception('Node with id $id not found');
    }
  }

  void addNode(String parentId) {
    assert(!state.isLoading, 'Cannot change title while state is loading');
    final currentState = state.value;
    if (currentState == null) {
      return;
    }
    final node = TreeNode(
      id: const Uuid().v4(),
      title: '', // TODO(ohike): placeholder for title
      parentId: parentId,
    );
    // [parentId] is not null,
    // so we find the parent node and add the new node as a child
    final parentNode = currentState.tree.firstWhereOrNull(
      (TreeNode e) => e.id == parentId,
    );
    if (parentNode != null) {
      final updatedChildren = [...parentNode.childrenId, node.id];
      final updatedParent = parentNode.copyWith(childrenId: updatedChildren);
      final updatedTree = [
        ...currentState.tree.map(
          (TreeNode e) => e.id == parentId ? updatedParent : e,
        ),
        node,
      ];
      state = AsyncValue.data(currentState.copyWith(tree: updatedTree));
    } else {
      throw Exception('Parent node with id $parentId not found');
    }
  }

  void removeNode(String id) {
    assert(!state.isLoading, 'Cannot change title while state is loading');
    final currentState = state.value;
    if (currentState == null) {
      return;
    }
    final node = currentState.tree.firstWhereOrNull((TreeNode e) => e.id == id);
    if (node != null) {
      for (final childId in node.childrenId) {
        removeNode(childId);
      }

      final latestState = state.value;
      if (latestState == null) {
        return;
      }
      var updatedTree = latestState.tree.where((e) => e.id != id).toList();
      if (node.parentId != null) {
        final parentNode = updatedTree.firstWhereOrNull(
          (TreeNode e) => e.id == node.parentId,
        );
        if (parentNode != null) {
          final updatedChildren = parentNode.childrenId
              .where((childId) => childId != id)
              .toList();
          final updatedParent = parentNode.copyWith(
            childrenId: updatedChildren,
          );
          updatedTree = updatedTree
              .map(
                (TreeNode e) => e.id == node.parentId ? updatedParent : e,
              )
              .toList();
        }
      }

      state = AsyncValue.data(latestState.copyWith(tree: updatedTree));
    } else {
      throw Exception('Node with id $id not found');
    }
  }

  Future<void> saveTree(String treeId, List<TreeNode> tree) async {
    final currentState = state.value;
    if (currentState == null) {
      return;
    }
    state = const AsyncValue<MindMapState>.loading().copyWithPrevious(state);

    final saveResult = await _mindMapRepository
        .saveTree(treeId, tree)
        .then(
          (value) => true,
        )
        .onError(
          (error, stackTrace) => throw Exception('Failed to save mind map'),
        );

    state = AsyncValue.data(
      currentState.copyWith(saveTreeResult: saveResult),
    ).copyWithPrevious(state);
  }
}
