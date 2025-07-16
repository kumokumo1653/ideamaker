import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/features/mind_map/controllers/mind_map_controller.dart';
import 'package:idea_maker/features/mind_map/entities/tree_node.dart';
import 'package:idea_maker/features/mind_map/widgets/widgets.dart';

class MindMapPage extends HookConsumerWidget {
  const MindMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mindMapState = ref.watch(mindMapControllerProvider);
    final rootNode = mindMapState.tree.firstWhere(
      (node) => node.parentId == null,
    );
    return Scaffold(
      body: Center(
        child: _buildNode(
          context,
          ref,
          tree: mindMapState.tree,
          rootNode: rootNode,
        ),
      ),
    );
  }

  Widget _buildNode(
    BuildContext context,
    WidgetRef ref, {
    required List<TreeNode> tree,
    required TreeNode rootNode,
  }) {
    final theme = Theme.of(context);
    final mindMapNotifier = ref.watch(mindMapControllerProvider.notifier);

    final parentNode = tree.firstWhereOrNull(
      (node) => node.id == rootNode.parentId,
    );
    final isLastSibling =
        parentNode != null && parentNode.childrenId.last == rootNode.id;

    return Tree(
      node: MindMapNode(
        node: rootNode,
        onChangedTitle: (title) =>
            mindMapNotifier.changeTitle(rootNode.id, title),
        onTapAddChild: rootNode.childrenId.isEmpty
            ? () => mindMapNotifier.addNode(rootNode.id)
            : null,
        onTapAddSibling: isLastSibling
            ? () => mindMapNotifier.addNode(parentNode.id)
            : null,
      ),
      branchColor: theme.colorScheme.primary,
      leaves: rootNode.childrenId.map((childId) {
        final childNode = tree.firstWhere((node) => node.id == childId);
        return _buildNode(context, ref, tree: tree, rootNode: childNode);
      }).toList(),
    );
  }
}
