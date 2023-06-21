import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    return TextFormField(
      // keyboardType: ,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      focusNode: focusNode,
      decoration: InputDecoration(
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: colors.primary),
        //   borderRadius: BorderRadius.circular(20)
        // ),
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('onPressed: $textValue');
            textController.clear();
          },
        )
      ),
      onFieldSubmitted: (value) {
        print('Submit: $value');
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Change: $value');
      // },
    );
  }
}