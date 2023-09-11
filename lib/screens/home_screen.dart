import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quoteslife/model/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:quoteslife/screens/drawer_screen.dart';
import 'package:quoteslife/screens/quotes_details.dart';
import 'package:quoteslife/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "Tap the button to get a quote.";
  List<QuotesApi> appList = [];

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
      drawer: DrawerScreen(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  child: Center(
                    child: CustomText(
                      texxt: 'Day of the Quotes',
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  // Wrap the ListView.builder with Expanded
                  child: ListView.builder(
                    itemCount: appList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10.0),
                        shadowColor: Colors.black45,
                        child: Column(
                          children: [
                            Container(),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuoteDetailScreen(
                                      q: appList[index].q,
                                      a: appList[index].a,
                                    ),
                                  ),
                                );
                              },
                              leading: const Icon(
                                Icons.read_more_outlined,
                                size: 30,
                              ),
                              title: Text(
                                appList[index].a,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.all(10.0),
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    appList[index].q,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            // return const Center(
            //   child: LinearProgressIndicator(
            //     backgroundColor: Colors.grey,
            //     color: Colors.white,
            //   ),
            // );
            return Center(
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
            );
          }
        },
      ),
    );
  }

  Future<List<QuotesApi>> getData() async {
    final response =
        await http.get(Uri.parse('https://zenquotes.io/api/quotes'));
    var data = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        appList.add(QuotesApi.fromJson(index));
      }
      return appList;
    } else {
      return appList;
    }
  }
}
