import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quoteslife/pages/quotes_day.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const DrawerHeader(
            child: CircleAvatar(
          minRadius: 20,
          child: Center(
            child: Icon(Icons.person_4),
          ),
        )),
        Card(
          elevation: 5.0,
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuotesDay(),
                  ));
            },
            leading: const Icon(CupertinoIcons.book),
            title: const Text('Quotes of Day'),
          ),
        ),
      ],
    ));
  }
}
