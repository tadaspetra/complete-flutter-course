import 'package:flutter/cupertino.dart';

class CupertinoHome extends StatefulWidget {
  const CupertinoHome({super.key});

  @override
  State<CupertinoHome> createState() => _CupertinoHomeState();
}

class _CupertinoHomeState extends State<CupertinoHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Cupertino Design"),
        trailing: CupertinoButton(
          onPressed: _incrementCounter,
          padding: const EdgeInsets.all(4.0),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
            Text(
              '$_counter',
              style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
