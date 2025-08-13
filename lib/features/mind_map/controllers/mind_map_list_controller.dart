import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/repositories/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mind_map_list_controller.g.dart';

@riverpod
class MindMapListController extends _$MindMapListController {
  MindMapRepository get _mindMapRepository =>
      ref.watch(mindMapRepositoryProvider);

  @override
  FutureOr<List<MindMapSummary>> build() async {
    return _mindMapRepository.fetchMindMapList().onError((error, stackTrace) {
      throw Exception('Failed to fetch mind map list: $error');
    });
  }
}
