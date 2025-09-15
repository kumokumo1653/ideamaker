import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/controllers/user_status_controller.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/exceptions/client_exception.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:idea_maker/core/services/firestore/model.dart';
import 'package:idea_maker/core/services/firestore/schema.dart';
import 'package:idea_maker/utils/utils.dart' as utils;
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
    final firestore = FirebaseFirestore.instance;
    final odm = FirestoreODM(appSchema, firestore: firestore);
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw NotSignInException();
    }
    return odm
        .env(getEnv(utils.Env.flavor).id)
        .users(user.userId)
        .mindMaps(treeId)
        .get()
        .then((mindMap) {
          if (mindMap == null) {
            throw Exception('Mind map not found');
          }
          return mindMap.tree;
        })
        .onError((error, stackTrace) {
          throw Exception('Failed to fetch mind map: $error');
        });
  }

  @override
  Future<void> saveTree(String treeId, List<TreeNode> tree) {
    final firestore = FirebaseFirestore.instance;
    final odm = FirestoreODM(appSchema, firestore: firestore);
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw NotSignInException();
    }
    return odm
        .env(getEnv(utils.Env.flavor).id)
        .users(user.userId)
        .mindMaps
        .upsert(
          MindMap(
            id: treeId,
            tree: tree,
            updatedAt: FirestoreODM.serverTimestamp,
          ),
        )
        .onError((error, stackTrace) {
          throw Exception('Failed to save mind map: $error');
        });
  }

  @override
  Future<void> deleteMindMap(String treeId) async {
    final firestore = FirebaseFirestore.instance;
    final odm = FirestoreODM(appSchema, firestore: firestore);
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw NotSignInException();
    }
    return odm
        .env(getEnv(utils.Env.flavor).id)
        .users(user.userId)
        .mindMaps(treeId)
        .delete()
        .onError((
          error,
          stackTrace,
        ) {
          throw Exception('Failed to delete mind map: $error');
        });
  }

  @override
  Future<List<MindMapSummary>> fetchMindMapList() async {
    final firestore = FirebaseFirestore.instance;
    final odm = FirestoreODM(appSchema, firestore: firestore);
    final user = ref.read(userStatusControllerProvider).valueOrNull;
    if (user == null) {
      throw NotSignInException();
    }
    final mindMaps = await odm
        .env(getEnv(utils.Env.flavor).id)
        .users(user.userId)
        .mindMaps
        .get();
    mindMaps.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return mindMaps.map((mindMap) {
      // Extract title from the first root node
      final rootNode = mindMap.tree.firstWhere(
        (TreeNode node) => node.parentId == null,
        orElse: () => mindMap.tree.first,
      );
      final title = rootNode.title.isEmpty ? 'Untitled' : rootNode.title;

      return MindMapSummary(
        id: mindMap.id,
        title: title,
        updatedAt: mindMap.updatedAt,
        nodeCount: mindMap.tree.length,
      );
    }).toList();
  }
}
