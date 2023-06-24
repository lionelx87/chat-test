import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_test/config/theme/app_theme.dart';
import 'package:chat_test/presentation/providers/chat_provider.dart';
import 'package:chat_test/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Chat Test',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
      ),
    );
  }
}
