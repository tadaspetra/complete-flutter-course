import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> tiles = [
    const ColorTile(key: ValueKey(true)),
    const ColorTile(),
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
  Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: randomColor,
    );
  }
}
