import 'package:flutter/material.dart';
import 'package:second_app/config/helpers/get_yes_no_answer.dart';
import 'package:second_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola', sender: Sender.MY),
    Message(text: 'Regresaste?', sender: Sender.MY),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, sender: Sender.MY);
    messageList.add(newMessage);
    if(text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  } 

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

}