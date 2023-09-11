import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quoteslife/model/quotes_day_model.dart';
import 'package:quoteslife/screens/drawer_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class QuotesDay extends StatefulWidget {
  const QuotesDay({super.key});

  @override
  State<QuotesDay> createState() => _QuotesDayState();
}

class _QuotesDayState extends State<QuotesDay> {
  List<QuotesDayApi> quotesDay = [];
  String randomQuote = ''; // Store the random quote text

  @override
  void initState() {
    super.initState();
    // Fetch random quotes when the screen is first loaded.
    fetchRandomQuotes();
  }

  // Function to fetch random quotes
  Future<void> fetchRandomQuotes() async {
    try {
      final response =
          await http.get(Uri.parse('https://zenquotes.io/api/random'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data.isNotEmpty) {
          // Get the first quote from the response
          var randomIndex = Random().nextInt(data.length);
          var randomQuoteText = data[randomIndex]['q'];

          setState(() {
            randomQuote = randomQuoteText;
          });
        }
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      // Handle any errors here, e.g., show an error message to the user
      print('Error fetching quotes: $e');
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Fetch random quotes when the refresh button is clicked.
              fetchRandomQuotes();
            },
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: randomQuote.isEmpty
          ? Center(
              child: SizedBox(
                width: 500.0,
                height: 300.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.black54,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    'Loading,\nPlease wait',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Container(
                height: 250,
                width: 480,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 0.5,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      )
                    ]),
                child: Center(
                  child: Text(
                    randomQuote,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Future<List<QuotesDayApi>> getDayofQuotes() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/random'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (Map<String, dynamic> index in data) {
        quotesDay.add(QuotesDayApi.fromJson(index));
      }
      return quotesDay;
    } else {
      throw Exception('Failed to load quotes'); // Throw an exception on error
    }
  }
}
