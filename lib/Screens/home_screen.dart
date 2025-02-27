import 'package:flutter/material.dart';
import 'package:sentencer/Services/data_fetcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "Press the button to get a random quote";
  final DataFetcher dataFetcher = DataFetcher();

  void updateQuote() async {
    String newQuote = await dataFetcher.fetchData();
    setState(() {
      quote = newQuote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Sentence Generator',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.all(16.0),
                width: double.infinity,
                child: Text(
                  quote,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: updateQuote,
                child: Text(
                  "Click for a new sentence",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
          ],
        ),
      ),
    );
  }
}
