import 'package:context/screens/first.dart';
import 'package:context/screens/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // When navigating to the "/" route, build the Home widget.
        '/': (context) => const MyHomePage(),
        // When navigating to the "/second" route, build the SecondRoute widget.
        '/second': (context) => const SecondRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const FirstRoute(text: "Tadas")),
                );
              },
              child: const Text("Go To First Route"),
            ),
            TextButton(
              onPressed: () async {
                final response = await Navigator.pushNamed(context, '/second',
                    arguments: "Andrei");
                print(response);
              },
              child: const Text("Go To Second Route"),
            ),
          ],
        ),
      ),
    );
  }
}
