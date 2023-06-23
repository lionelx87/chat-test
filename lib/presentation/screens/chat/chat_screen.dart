import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/domain/entities/message.dart';
import 'package:second_app/presentation/providers/chat_provider.dart';
import 'package:second_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:second_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:second_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.ac_unit),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZzDz1k0oDPhznmAyUVM_AFkruDALBeCxLX58MjS1ZZJQVyXrarwg3hvvOX-rkVzpuERk&usqp=CAU'),
          ),
        ),
        title: const Text('Mensaje'),
        // centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Expanded(child: Container(
            //   color: Colors.red,
            // )),
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return ( message.sender == Sender.MY ) ? MyMessageBubble(message: message,) : HerMessageBubble( message: message, );
                      // return Text('Indice: $index');
                      // return MyMessageBubble();

                      // return ( index % 2 == 0 ) ? const HerMessageBubble() : const MyMessageBubble();
                    })),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
              // onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
