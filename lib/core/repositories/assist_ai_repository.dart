import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/repositories/assist_ai_mock_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'assist_ai_repository.g.dart';

@riverpod
AssistAIRepository assistAIRepository(Ref ref) {
  return AssistAiMockRepositoryImpl();
}

abstract interface class AssistAIRepository {
  /// Generates associations for the given [keyword].
  Future<List<String>> generateAssociations(String keyword);
}
