import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/api/api.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mind_map_repository_impl.g.dart';

@riverpod
MindMapRepository mindMapRepository(Ref ref) {
  return MindMapRepositoryImpl(ref);
}

class MindMapRepositoryImpl implements MindMapRepository {
  MindMapRepositoryImpl(this.ref);

  final Ref ref;
  @override
  Future<List<TreeNode>> fetchTree(String treeId) async {
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw Exception('User not signed in');
    }
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.userId)
        .collection('mind_maps')
        .doc(treeId)
        .get();
    if (!snapshot.exists) {
      throw Exception('Mind map not found');
    }
    final data = snapshot.data();
    if (data == null) {
      throw Exception('Invalid mind map data');
    }
    final treeData = List<Map<String, dynamic>>.from(data['tree'] as List);
    return treeData.map(TreeNode.fromJson).toList();
  }

  @override
  Future<void> saveTree(String treeId, List<TreeNode> tree) {
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw Exception('User not signed in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.userId)
        .collection('mind_maps')
        .doc(treeId)
        .set({'tree': tree.map((e) => e.toJson()).toList()});
  }
}
