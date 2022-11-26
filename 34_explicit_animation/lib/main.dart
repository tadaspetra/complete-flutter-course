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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool state = true;
  late final AnimationController _animationController = AnimationController(
      duration: const Duration(seconds: 2), vsync: this, lowerBound: 0.5);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _animation,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: state ? 100 : 200,
              height: state ? 100 : 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (state) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
          setState(() {
            state = !state;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
