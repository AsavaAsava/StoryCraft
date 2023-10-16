import 'package:flutter/material.dart';
import 'package:storycraft/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoryCraft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xFFfec200),
          secondary: const Color(0xFFffe07d),
          tertiary: const Color(0xFF422c33),
          seedColor: const Color(0xFFfec200),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFfefffe),
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
