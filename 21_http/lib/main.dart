import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool appBarColor = true;
  List<String> bookNames = [];
  Future<void> _incrementCounter() async {
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<String> temp = [];
      for (int i = 0; i < 10; i++) {
        temp.add(jsonResponse["items"][i]["volumeInfo"]["title"]);
      }
      setState(() {
        bookNames.addAll(temp);
      });
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async"),
        backgroundColor: appBarColor ? Colors.blue : Colors.red,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: bookNames.length,
            itemBuilder: (context, j) {
              return Text(bookNames[j]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _incrementCounter();
          setState(() {
            appBarColor = !appBarColor;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
