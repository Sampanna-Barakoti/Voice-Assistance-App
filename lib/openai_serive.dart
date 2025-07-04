import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voice_assistant/secret.dart';

class OpenAIService {
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      print('Prompt sent: $prompt');
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apikey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture, image, art, or anything similar? $prompt. Simply answer with yes or no.',
            },
          ],
        }),
      );
      print('making req');
      print(res.body);
      if (res.statusCode == 200) {
        print('geeting response');
      }
      return 'Ai';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    return 'chatgpt';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'dallE';
  }
}
