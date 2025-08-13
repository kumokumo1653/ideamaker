import 'package:idea_maker/core/entities/entities.dart';

abstract interface class MindMapRepository {
  /// Fetches the mind map tree for a given [treeId].
  Future<List<TreeNode>> fetchTree(String treeId);

  /// Saves the mind map tree for a given [treeId].
  Future<void> saveTree(String treeId, List<TreeNode> tree);

  /// Fetches all mind maps for the current user.
  Future<List<MindMapSummary>> fetchMindMapList();
}
