import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:idea_maker/features/mind_map/controllers/mind_map_controller.dart';

// モックのMindMapRepository
class MockMindMapRepository implements MindMapRepository {
  @override
  Future<List<TreeNode>> fetchTree(String treeId) async {
    return [];
  }

  @override
  Future<void> saveTree(String treeId, List<TreeNode> tree) async {}

  @override
  Future<List<MindMapSummary>> fetchMindMapList() async {
    return [];
  }

  @override
  Future<void> deleteMindMap(String treeId) {
    return Future.value();
  }
}

void main() {
  group('MindMapController', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          // override the mindMapRepositoryProvider with a mock
          mindMapRepositoryProvider.overrideWithValue(MockMindMapRepository()),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態では空のタイトルを持つルートノードが1つ存在する', () async {
      final state = await container.read(
        mindMapControllerProvider(null).future,
      );

      expect(state.tree.length, 1);
      expect(state.tree.first.title, '');
      expect(state.tree.first.parentId, null);
      expect(state.tree.first.childrenId, isEmpty);
    });

    test('changeTitleメソッドでノードのタイトルを変更できる', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final nodeId = initialState.tree.first.id;

      controller.changeTitle(nodeId, '新しいタイトル');

      final updatedAsyncState = container.read(mindMapControllerProvider(null));
      final updatedState = updatedAsyncState.valueOrNull!;
      expect(updatedState.tree.first.title, '新しいタイトル');
      expect(updatedState.tree.first.id, nodeId);
    });

    test('存在しないノードIDでchangeTitleを呼ぶと例外が発生する', () async {
      await container.read(mindMapControllerProvider(null).future);
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );

      expect(
        () => controller.changeTitle('存在しないID', 'タイトル'),
        throwsA(isA<Exception>()),
      );
    });

    test('addNodeメソッドで子ノードを追加できる', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final parentId = initialState.tree.first.id;

      controller.addNode(parentId);

      final updatedAsyncState = container.read(mindMapControllerProvider(null));
      final updatedState = updatedAsyncState.valueOrNull!;
      expect(updatedState.tree.length, 2);

      final parentNode = updatedState.tree.firstWhere(
        (node) => node.id == parentId,
      );
      final childNode = updatedState.tree.firstWhere(
        (node) => node.parentId == parentId,
      );

      expect(parentNode.childrenId.length, 1);
      expect(parentNode.childrenId.first, childNode.id);
      expect(childNode.parentId, parentId);
      expect(childNode.title, '');
    });

    test('存在しない親IDでaddNodeを呼ぶと例外が発生する', () async {
      await container.read(mindMapControllerProvider(null).future);
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );

      expect(
        () => controller.addNode('存在しない親ID'),
        throwsA(isA<Exception>()),
      );
    });

    test('removeNodeメソッドでノードを削除できる', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final parentId = initialState.tree.first.id;

      controller.addNode(parentId);
      final stateAfterAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterAdd = stateAfterAddAsync.valueOrNull!;
      final childNode = stateAfterAdd.tree.firstWhere(
        (node) => node.parentId == parentId,
      );

      controller.removeNode(childNode.id);

      final stateAfterRemoveAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterRemove = stateAfterRemoveAsync.valueOrNull!;
      expect(stateAfterRemove.tree.length, 1);
      expect(
        stateAfterRemove.tree.any((node) => node.id == childNode.id),
        false,
      );

      final parentNode = stateAfterRemove.tree.firstWhere(
        (node) => node.id == parentId,
      );
      expect(parentNode.childrenId, isEmpty);
    });

    test('存在しないノードIDでremoveNodeを呼ぶと例外が発生する', () async {
      await container.read(mindMapControllerProvider(null).future);
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );

      expect(
        () => controller.removeNode('存在しないID'),
        throwsA(isA<Exception>()),
      );
    });

    test('複数の子ノードがある場合, 任意の子ノードを削除できる', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final parentId = initialState.tree.first.id;

      controller
        ..addNode(parentId)
        ..addNode(parentId)
        ..addNode(parentId);

      final stateAfterAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterAdd = stateAfterAddAsync.valueOrNull!;
      expect(stateAfterAdd.tree.length, 4); // 親1 + 子3

      final parentNode = stateAfterAdd.tree.firstWhere(
        (node) => node.id == parentId,
      );
      expect(parentNode.childrenId.length, 3);

      final firstChildId = parentNode.childrenId.first;
      controller.removeNode(firstChildId);

      final stateAfterRemoveAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterRemove = stateAfterRemoveAsync.valueOrNull!;
      expect(stateAfterRemove.tree.length, 3); // 親1 + 子2

      final updatedParentNode = stateAfterRemove.tree.firstWhere(
        (node) => node.id == parentId,
      );
      expect(updatedParentNode.childrenId.length, 2);
      expect(updatedParentNode.childrenId.contains(firstChildId), false);
    });

    test('子を持つノードの削除で子ノードも削除できる', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final rootId = initialState.tree.first.id;

      // 階層構造を作成: root -> parent -> child
      controller.addNode(rootId);
      final stateAfterParentAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterParentAdd = stateAfterParentAddAsync.valueOrNull!;
      final parentNode = stateAfterParentAdd.tree.firstWhere(
        (node) => node.parentId == rootId,
      );

      controller.addNode(parentNode.id);
      final stateAfterChildAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterChildAdd = stateAfterChildAddAsync.valueOrNull!;
      final childNode = stateAfterChildAdd.tree.firstWhere(
        (node) => node.parentId == parentNode.id,
      );

      expect(stateAfterChildAdd.tree.length, 3); // root + parent + child

      controller.removeNode(parentNode.id);

      final stateAfterRemoveAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterRemove = stateAfterRemoveAsync.valueOrNull!;
      expect(
        stateAfterRemove.tree.any((node) => node.id == parentNode.id),
        false,
      );
      expect(
        stateAfterRemove.tree.any((node) => node.id == childNode.id),
        false,
      );
      final rootNode = stateAfterRemove.tree.firstWhere(
        (node) => node.id == rootId,
      );
      expect(rootNode.childrenId.contains(parentNode.id), false);
      expect(stateAfterRemove.tree.length, 1);
    });

    test('ネストした構造での操作テスト', () async {
      final initialState = await container.read(
        mindMapControllerProvider(null).future,
      );
      final controller = container.read(
        mindMapControllerProvider(null).notifier,
      );
      final rootId = initialState.tree.first.id;

      controller.addNode(rootId);
      final stateAfterFirstAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterFirstAdd = stateAfterFirstAddAsync.valueOrNull!;
      final child1 = stateAfterFirstAdd.tree.firstWhere(
        (node) => node.parentId == rootId,
      );

      controller.addNode(child1.id);
      final stateAfterSecondAddAsync = container.read(
        mindMapControllerProvider(null),
      );
      final stateAfterSecondAdd = stateAfterSecondAddAsync.valueOrNull!;

      expect(stateAfterSecondAdd.tree.length, 3);

      controller
        ..changeTitle(rootId, 'ルート')
        ..changeTitle(child1.id, '子ノード1');

      final grandchild = stateAfterSecondAdd.tree.firstWhere(
        (node) => node.parentId == child1.id,
      );
      controller.changeTitle(grandchild.id, '孫ノード');

      final finalAsyncState = container.read(mindMapControllerProvider(null));
      final finalState = finalAsyncState.valueOrNull!;
      final rootNode = finalState.tree.firstWhere((node) => node.id == rootId);
      final childNode = finalState.tree.firstWhere(
        (node) => node.id == child1.id,
      );
      final grandchildNode = finalState.tree.firstWhere(
        (node) => node.id == grandchild.id,
      );

      expect(rootNode.title, 'ルート');
      expect(childNode.title, '子ノード1');
      expect(grandchildNode.title, '孫ノード');
      expect(rootNode.childrenId.contains(child1.id), true);
      expect(childNode.childrenId.contains(grandchild.id), true);
    });
  });
}
