import 'package:flutter/material.dart';
import 'package:quoteslife/screens/drawer_screen.dart';

class QuotesImage extends StatefulWidget {
  const QuotesImage({super.key});

  @override
  State<QuotesImage> createState() => _QuotesImageState();
}

class _QuotesImageState extends State<QuotesImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QuotesLIFE',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      drawer: const DrawerScreen(),
    );
  }
}
