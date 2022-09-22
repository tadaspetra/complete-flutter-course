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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateless Demo"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              //shape: BoxShape.circle,
              border: Border.all(color: Colors.red, width: 20),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            height: 200,
            width: 200,
            transform: Matrix4.rotationZ(0.1),
            child: const Text(
              'Container',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              //shape: BoxShape.circle,
              border: Border.all(color: Colors.red, width: 20),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            height: 200,
            width: 200,
            transform: Matrix4.rotationZ(0.1),
            child: const Text(
              'Container',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
