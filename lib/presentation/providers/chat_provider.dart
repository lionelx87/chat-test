import 'package:flutter/material.dart';
import 'package:second_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola', sender: Sender.MY),
    Message(text: 'Regresaste?', sender: Sender.MY),
  ];

  Future<void> sendMessage(String text) async {
    // TODO
  } 

}