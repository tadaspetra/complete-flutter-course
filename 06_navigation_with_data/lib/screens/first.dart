import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  final String text;
  const FirstRoute({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(text),
        ),
      ),
    );
  }
}
