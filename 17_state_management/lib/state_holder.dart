import 'package:context/state.dart';
import 'package:flutter/material.dart';

class AppStateHolder extends StatefulWidget {
  const AppStateHolder({required this.child, Key? key}) : super(key: key);

  final Widget child;

  static AppStateHolderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateHolderState>()!;
  }

  @override
  AppStateHolderState createState() => AppStateHolderState();
}

class AppStateHolderState extends State<AppStateHolder> {
  AppState _data = AppState(counter: 0);

  void add() {
    int newCounter = _data.counter + 1;
    setState(() {
      _data = _data.copyWith(counter: newCounter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      _data,
      child: widget.child,
    );
  }
}
