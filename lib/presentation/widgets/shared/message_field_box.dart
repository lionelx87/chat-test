import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue; 

  const MessageFieldBox({super.key, required this.onValue});

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
            // print('onPressed: $textValue');
            onValue(textValue);
            textController.clear();
            focusNode.requestFocus();
          },
        )
      ),
      onFieldSubmitted: (value) {
        // print('Submit: $value');
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Change: $value');
      // },
    );
  }
}