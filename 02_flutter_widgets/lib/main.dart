import 'package:flutter/material.dart';

void main() {
  runApp(const TadasApp());
}

class TadasApp extends StatelessWidget {
  const TadasApp({super.key});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Default App"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 10),
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue,
              ),
              child: PageView(
                children: const [
                  Text(
                    "Tadas",
                  ),
                  Text(
                    "Andrei",
                  ),
                  Text(
                    "Last Entry",
                  ),
                  Text(
                    "Tadas",
                  ),
                  Text(
                    "Andrei",
                  ),
                  Text(
                    "Last Entry",
                  ),
                  Text(
                    "Tadas",
                  ),
                  Text(
                    "Andrei",
                  ),
                  Text(
                    "Last Entry",
                  ),
                  Text(
                    "Tadas",
                  ),
                  Text(
                    "Andrei",
                  ),
                  Text(
                    "Last Entry",
                  ),
                  Text(
                    "Tadas",
                  ),
                  Text(
                    "Andrei",
                  ),
                  Text(
                    "Last Entry",
                  ),
                ],
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
