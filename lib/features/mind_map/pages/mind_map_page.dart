import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/tree_node.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
import 'package:idea_maker/features/mind_map/controllers/mind_map_controller.dart';
import 'package:idea_maker/features/mind_map/widgets/widgets.dart';

class MindMapPage extends HookConsumerWidget {
  const MindMapPage({this.treeId, super.key});

  final String? treeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mindMapAsyncState = ref.watch(mindMapControllerProvider(treeId));

    return AsyncWidget(
      mindMapAsyncState,
      builder: (mindMapState) {
        final rootNode = useMemoized(
          () => mindMapState.tree.firstWhere(
            (node) => node.parentId == null,
          ),
          [mindMapState.tree],
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
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () => ref
                .read(mindMapControllerProvider(treeId).notifier)
                .saveTree(mindMapState.treeId, mindMapState.tree),
          ),
        );
      },
    );
  }

  Widget _buildNode(
    BuildContext context,
    WidgetRef ref, {
    required List<TreeNode> tree,
    required TreeNode rootNode,
  }) {
    final theme = Theme.of(context);
    final mindMapController = ref.watch(
      mindMapControllerProvider(treeId).notifier,
    );

    final parentNode = tree.firstWhereOrNull(
      (node) => node.id == rootNode.parentId,
    );
    return Tree(
      node: MindMapNode(
        node: rootNode,
        onChangedTitle: (title) =>
            mindMapController.changeTitle(rootNode.id, title),
        onTapAddChild: () => mindMapController.addNode(rootNode.id),
        onTapAddSibling: parentNode != null
            ? () => mindMapController.addNode(parentNode.id)
            : null,
        onTapRemove: parentNode != null
            ? () => mindMapController.removeNode(rootNode.id)
            : null,
        onTapAssistAI: rootNode.title.isNotEmpty
            ? () => mindMapController.assistAI(rootNode.id)
            : null,
        hasActions: rootNode.childrenId.isEmpty,
      ),
      branchColor: theme.colorScheme.primary,
      leaves: rootNode.childrenId.map((childId) {
        final childNode = tree.firstWhere((node) => node.id == childId);
        return _buildNode(context, ref, tree: tree, rootNode: childNode);
      }).toList(),
    );
  }
}
