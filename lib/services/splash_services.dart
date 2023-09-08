import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:quoteslife/screens/home_screen.dart';

class SplashServices {
  void splashServices(BuildContext context) {
    Timer(
        const Duration(
          seconds: 4,
        ), () {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }
}
