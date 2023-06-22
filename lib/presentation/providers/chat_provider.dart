import 'package:flutter/material.dart';
import 'package:second_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola', sender: Sender.MY),
    Message(text: 'Regresaste?', sender: Sender.MY),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, sender: Sender.MY);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  } 

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

}