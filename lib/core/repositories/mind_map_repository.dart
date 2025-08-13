import 'package:idea_maker/core/entities/entities.dart';

abstract interface class MindMapRepository {
  /// Fetches the mind map tree for a given [treeId].
  Future<List<TreeNode>> fetchTree(String treeId);

  /// Saves the mind map tree for a given [treeId].
  Future<void> saveTree(String treeId, List<TreeNode> tree);

  /// Deletes the mind map for a given [treeId].
  Future<void> deleteMindMap(String treeId);

  /// Fetches all mind maps for the current user.
  Future<List<MindMapSummary>> fetchMindMapList();
}
