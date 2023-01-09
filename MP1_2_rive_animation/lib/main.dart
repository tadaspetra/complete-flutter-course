import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
  SMIInput<bool>? _pressed;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Button');
    artboard.addController(controller!);
    _pressed = controller.findInput("Press");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moon Landing"),
      ),
      body: GestureDetector(
        onTapDown: (_) {
          _pressed?.value = true;
        },
        onTapCancel: () => _pressed?.value = false,
        onTapUp: (_) => _pressed?.value = false,
        child: RiveAnimation.asset(
          'assets/rocket.riv',
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
