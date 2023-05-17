import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text is Stateless',
            ),
            ListTile(
              leading: Icon(Icons.flutter_dash),
              tileColor: Colors.greenAccent,
              title: Text('ListTile is Stateless'),
            ),
            FlutterLogo(
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
