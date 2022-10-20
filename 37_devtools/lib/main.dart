import 'dart:developer' as developer;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = PageController(initialPage: 1);

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        children: const <Widget>[
          OverflowScreen(),
          JankScreen(),
          PerformanceScreen(),
        ],
      ),
    );
  }
}

class OverflowScreen extends StatelessWidget {
  const OverflowScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DevTools Demo"),
      ),
      body: Center(
        child: Row(
          children: [
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/twitterclone-50e91.appspot.com/o/users%2FAjfaN406Ugwl1UDuQ8Jp?alt=media&token=d7fe3a6d-ff2a-4bbe-bd54-2da195c0a3cd"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Flutter is amazing, and Tadas Petra is the best instructor ever",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JankScreen extends StatelessWidget {
  const JankScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DevTools Demo"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 20) return const ExpensiveWidget();
            return Text("index:$index");
          },
          itemCount: 100,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 30,
            );
          },
        ));
  }
}

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    developer.log('are we having a good time?', name: 'tadas petra log');
    return Stack(
      children: [
        for (int i = 0; i < 1000; i++)
          const Text(
            'index: 20',
          ),
      ],
    );
  }
}

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fibonacci(int n) {
      if (n < 2) {
        //base case
        return n;
      }
      return fibonacci(n - 2) + fibonacci(n - 1); //recursive case
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("DevTools Demo"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text("index:${fibonacci(30)}");
        },
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 30,
          );
        },
      ),
    );
  }
}
