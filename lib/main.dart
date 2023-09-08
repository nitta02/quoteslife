import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quoteslife/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes Life',
      theme: CupertinoThemeData(
          scaffoldBackgroundColor: Color(0xDEEDD19E),
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
            fontFamily: 'Kanit-Bold',
          ))),
      home: SplashScreen(),
    );
  }
}
