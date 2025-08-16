import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:idea_maker/core/repositories/assist_ai_repository.dart';
import 'package:idea_maker/utils/logger.dart';

class AssistAiRepositoryImpl implements AssistAIRepository {
  @override
  Future<List<String>> generateAssociations(String keyword) async {
    final model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-2.5-flash',
    );
    // ignore: lines_longer_than_80_chars
    final prompt = [
      Content.text(
        'マインドマップのキーワードとして「$keyword」を使って、関連するアイデアを5個生成してください。',
      ),
    ];
    final jsonSchema = Schema.array(items: Schema.string(nullable: false));
    final config = GenerationConfig(
      responseMimeType: 'application/json',
      responseSchema: jsonSchema,
    );

    final response = await model.generateContent(
      prompt,
      generationConfig: config,
    );
    if (response.text == null) {
      throw Exception('Failed to generate associations');
    }
    logger.i(response.text);
    final associations = jsonDecode(response.text!) as List<String>;
    return associations;
  }
}
