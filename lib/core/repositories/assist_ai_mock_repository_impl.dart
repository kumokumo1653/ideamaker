import 'package:idea_maker/core/repositories/assist_ai_repository.dart';

class AssistAiMockRepositoryImpl implements AssistAIRepository {
  @override
  Future<List<String>> generateAssociations(String keyword) async {
    return ['Mock Association 1', 'Mock Association 2', 'Mock Association 3'];
  }
}
