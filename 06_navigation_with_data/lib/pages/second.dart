import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("Hello, $name")),
      body: TextButton(
          onPressed: () {
            Navigator.of(context).pop("This is from the Second Screen");
          },
          child: const Text("Pop")),
    );
  }
}
