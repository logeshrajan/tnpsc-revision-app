import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mcq_model.dart';

class AzureFoundryService {
  static const String _endpoint = 'YOUR_FOUNDRY_ENDPOINT';
  static const String _apiKey = 'YOUR_API_KEY';
  static const String _deploymentName = 'YOUR_DEPLOYMENT_NAME';

  final http.Client _client = http.Client();

  Future<List<MCQ>> generateMCQs({
    required String topic,
    required String chapter,
    required int numQuestions,
    required String language,
  }) async {
    try {
      final prompt = _buildMCQPrompt(topic, chapter, numQuestions, language);
      
      final messages = [
        {
          'role': 'system',
          'content': 'You are a specialized AI assistant for TNPSC exam preparation. Generate accurate multiple-choice questions based on Tamil Nadu school textbooks.'
        },
        {
          'role': 'user',
          'content': prompt
        }
      ];
      
      final response = await _sendChatRequest(messages);
      return _parseMCQResponse(response);
    } catch (e) {
      throw Exception('Failed to generate MCQs: $e');
    }
  }

  String _buildMCQPrompt(String topic, String chapter, int numQuestions, String language) {
    return '''
Generate $numQuestions multiple-choice questions for TNPSC exam preparation on the topic: $topic from chapter: $chapter.

Requirements:
- Questions should be in $language language
- Each question should have 4 options (A, B, C, D)
- Include one correct answer and explanation
- Focus on TNPSC exam pattern and difficulty level

Format the response as JSON:
{
  "questions": [
    {
      "id": "unique_id",
      "question": "Question text",
      "options": ["Option A", "Option B", "Option C", "Option D"],
      "correctAnswerIndex": 0,
      "explanation": "Explanation for the correct answer",
      "topic": "$topic",
      "difficulty": "medium",
      "sourceReference": "Reference to textbook section"
    }
  ]
}
''';
  }

  Future<Map<String, dynamic>> _sendChatRequest(List<Map<String, dynamic>> messages) async {
    final url = Uri.parse('$_endpoint/v1/chat/completions');
    
    final response = await _client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
        'azureml-model-deployment': _deploymentName,
      },
      body: json.encode({
        'messages': messages,
        'max_tokens': 1500,
        'temperature': 0.7,
      }),
    );
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('API call failed: ${response.statusCode}');
    }
  }

  List<MCQ> _parseMCQResponse(Map<String, dynamic> response) {
    // TODO: Implement proper parsing logic
    // This is a placeholder implementation
    return [];
  }

  void dispose() {
    _client.close();
  }
}
