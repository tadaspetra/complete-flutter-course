import 'package:flutter/material.dart';

class AppState {
  AppState({
    required this.counter,
  });

  final int counter;

  AppState copyWith({
    int? counter,
  }) {
    return AppState(
      counter: counter ?? this.counter,
    );
  }
}

class Provider extends InheritedWidget {
  const Provider(this.data, {Key? key, required Widget child}) : super(key: key, child: child);

  final AppState data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.data;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return data != oldWidget.data;
  }
}
