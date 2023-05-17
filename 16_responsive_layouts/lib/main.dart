import 'package:context/layout_page.dart';
import 'package:flutter/material.dart';

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
  Widget _bigDisplay() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.yellow,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Column 1"),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.lightGreen,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Column 2"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _smallDisplay() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.yellow,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Row 1"),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.lightGreen,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Row 2"),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layouts"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 40, 8),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LayoutPage()));
              },
              child: const Text(
                "Layout Builder ->",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: (width > 500) ? _bigDisplay() : _smallDisplay(),
      ),
    );
  }
}
