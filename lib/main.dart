import 'package:flutter/material.dart';
import 'package:quoteslife/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes Life',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(222, 201, 173, 122),
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: const Color(0xDEEDD19E),
        fontFamily: 'Kanit',
      ),
      home: const SplashScreen(),
    );
  }
}
