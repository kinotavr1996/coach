import 'package:google_generative_ai/google_generative_ai.dart';

abstract class AiService {
  Future<String> refineRole(String role, String vision, String responsibilities);
  Future<String> refineGoal(String goalText);
  Future<String> summarizeCheckIn(String checkInText);
}

class GeminiAiService implements AiService {
  GeminiAiService({required this.apiKey});

  final String apiKey;
  GenerativeModel? _model;

  GenerativeModel get _client {
    return _model ??= GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  @override
  Future<String> refineRole(
    String role,
    String vision,
    String responsibilities,
  ) {
    return _generate(
      'Сформулюй короткий бізнес-опис ролі. Роль: $role. Бачення: $vision. '
      'Відповідальність: $responsibilities. Зроби 3-5 зон відповідальності.',
    );
  }

  @override
  Future<String> refineGoal(String goalText) {
    return _generate(
      'Переформулюй ціль у форматі SMART і додай 2-3 метрики. '
      'Вхід: $goalText',
    );
  }

  @override
  Future<String> summarizeCheckIn(String checkInText) {
    return _generate(
      'Зроби коротке резюме чек-іну: прогрес, блокери, 1 наступний крок. '
      'Вхід: $checkInText',
    );
  }

  Future<String> _generate(String prompt) async {
    if (apiKey.isEmpty) {
      return _fallback(prompt);
    }
    try {
      final response = await _client.generateContent([
        Content.text(prompt),
      ]);
      return response.text ?? _fallback(prompt);
    } catch (_) {
      return _fallback(prompt);
    }
  }

  String _fallback(String prompt) {
    final preview = prompt.length > 120 ? prompt.substring(0, 120) : prompt;
    return 'AI недоступний. Підказка (чернетка): $preview';
  }
}
