import 'package:context/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterController);
    AsyncValue<int> asyncCounter = ref.watch(counterAsyncController);

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text("Basic: $counter"),
            const SizedBox(
              height: 100,
            ),
            asyncCounter.when(
              data: (int value) {
                return Text("AsyncValue: $value");
              },
              error: (Object error, StackTrace stackTrace) {
                return const Text("error");
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                ref.read(counterController.notifier).add();
                ref.read(counterAsyncController.notifier).add();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterController.notifier).add();
        },
      ),
    );
  }
}
