import 'package:auto_mechanic_advisor/feature/gpt/data/models/chat_model.dart';
import 'package:auto_mechanic_advisor/feature/gpt/data/repo/chat_repo.dart';
import 'package:dio/dio.dart';

class ChatRepoImpl implements ChatRepo {
  @override
  Future<String> makeRequest(List<Map<String, dynamic>> messagesHistory) async {
    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    // Extract text from messagesHistory
    List<String> texts = [];
    for (var message in messagesHistory) {
      if (message['content'] != null) {
        texts.add(message['content']);
      }
    }
    String concatenatedText = texts.join(' ');

    // Make request with concatenated text
    var response = await dio.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyA8pojGQfnUjZoKQpLesFLYPEvbD-pybaE',
      data: {
        'contents': [
          {
            'parts': [
              {
                'text': concatenatedText,
              }
            ]
          }
        ]
      },
    );
    ChatbotResponse response_2 = ChatbotResponse.fromJson(response.data);
    return response_2.data;
  }
}
