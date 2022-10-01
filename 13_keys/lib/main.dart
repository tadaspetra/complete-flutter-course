// ignore_for_file: prefer_const_constructors

import 'dart:math';

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
  List<Widget> tiles = [
    ColorTile(
      key: UniqueKey(),
    ),
    ColorTile(
      key: UniqueKey(),
    )
  ];

  _swapColors() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Swapper"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tiles[0],
            tiles[1],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapColors,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ColorTile extends StatefulWidget {
  const ColorTile({super.key});

  @override
  State<ColorTile> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: randomColor,
    );
  }
}
