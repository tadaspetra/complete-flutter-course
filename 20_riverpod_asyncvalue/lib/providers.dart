import 'package:context/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// counter state notifier for the app
final counterController = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}

// async state notifier provider for state that doesn't change in real time
final counterAsyncController =
    StateNotifierProvider<CounterAsyncNotifier, AsyncValue<int>>((ref) => CounterAsyncNotifier(ref));

class CounterAsyncNotifier extends StateNotifier<AsyncValue<int>> {
  CounterAsyncNotifier(this.ref) : super(const AsyncLoading()) {
    _init();
  }

  final Ref ref;

  void _init() async {
    int initializedValue = await ref.read(databaseProvider).initDatabase();
    state = AsyncData(initializedValue);
  }

  void add() async {
    state = const AsyncLoading();
    int count = await ref.read(databaseProvider).increment();
    state = AsyncData(count);
  }
}
