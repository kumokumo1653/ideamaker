import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/mind_map_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mind_map_repository.g.dart';

@riverpod
MindMapRepository mindMapRepository(Ref ref) {
  return MindMapRepositoryImpl(ref);
}

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
