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
  bool clicked = false;
  SMIInput<bool>? _pressed;
  String rocketText = "Press for Lift Off -->";

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
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  clicked = false;
                  rocketText = "Press for Lift Off -->";
                });
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0, right: 5),
                child: CircleAvatar(
                  radius: 60,
                  child: Image.asset("assets/mars.png"),
                ),
              )
            ],
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(90),
              child: Text(rocketText),
            ),
          )
        ],
      ),
      floatingActionButton: AnimatedContainer(
        padding: const EdgeInsets.only(top: 200),
        alignment: clicked ? Alignment.topRight : Alignment.bottomRight,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          width: 100,
          height: 100,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                clicked = true;
                rocketText = "";
              });
              _pressed?.value = true;
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  rocketText = "Successful Landing";
                });
              });
            },
            onTapCancel: () => _pressed?.value = false,
            onTapUp: (_) => _pressed?.value = false,
            child: RiveAnimation.asset(
              'assets/rocket.riv',
              onInit: _onRiveInit,
            ),
          ),
        ),
      ),
    );
  }
}
