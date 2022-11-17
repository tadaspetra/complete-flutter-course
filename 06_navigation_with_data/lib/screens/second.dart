import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey $args"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'this comes from SecondRoute');
              },
              child: const Text('Add First Route to Stack!'),
            ),
          ],
        ),
      ),
    );
  }
}
