import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/gpt/data/models/chat_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _user = ChatUser(id: '1', firstName: 'Mohab');
  final _bot = ChatUser(id: '2', firstName: 'Broxi');
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AUTO MECHANIC AI"),
        backgroundColor: ColorManager.blackColor,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: onSend,
        messages: messages,
        messageOptions: const MessageOptions(
          currentUserTextColor: ColorManager.whiteColor,
        ),
        inputOptions: const InputOptions(
          inputTextStyle: TextStyle(color: ColorManager.blackColor),
        ),
      ),
    );
  }

  void onSend(ChatMessage message) async {
    setState(() {
      messages.insert(0, message);
    });

    List<Map<String, dynamic>> messagesHistory =
        messages.reversed.map((message) {
      if (message.user == _user) {
        return {'role': 'user', 'content': message.text};
      } else {
        return {'role': 'assistant', 'content': message.text};
      }
    }).toList();

    // Make request to generate response
    var response = await makeRequest(messagesHistory);

    // Update chat UI with response
    if (response != null) {
      setState(() {
        messages.insert(
          0,
          ChatMessage(
            text: response,
            user: _bot,
            createdAt: DateTime.now(),
          ),
        );
      });
    }
  }

  Future<String?> makeRequest(
      List<Map<String, dynamic>> messagesHistory) async {
    try {
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
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDWw6-GqfdYeCjr1EudWYOw2rzyBUPL5zY',
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
      ApiResponse response_2 = ApiResponse.fromJson(response.data);
      return response_2.candidates[0].content.parts[0].text;
    } catch (e) {
      return null;
    }
  }
}