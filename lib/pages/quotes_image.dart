import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quoteslife/screens/drawer_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class QuotesImage extends StatefulWidget {
  const QuotesImage({super.key});

  @override
  State<QuotesImage> createState() => _QuotesImageState();
}

class _QuotesImageState extends State<QuotesImage> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    getImageData();
  }

  Future<void> getImageData() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/image'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final imageUrl = data['h'];

      print('Image URL: $imageUrl'); // Print the image URL for debugging

      setState(() {
        this.imageUrl = imageUrl;
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

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
      body: Center(
        child: imageUrl.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageData,
        tooltip: 'Fetch Random Image',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
