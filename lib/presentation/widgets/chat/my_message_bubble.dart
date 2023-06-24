import 'package:flutter/material.dart';
import 'package:chat_test/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble(
    {
      required this.message,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    // return Text('My Message');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),

        ),
        const SizedBox(height: 10,)
      ],
      
    );
  }
}