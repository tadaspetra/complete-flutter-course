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
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.read(normalProvider)),
            Consumer(
              builder: ((context, ref, child) {
                return Text(ref.read(normalProvider));
              }),
            ),
            ref.watch(messageProvider).when(data: (String value) {
              return Text(value);
            }, error: (err, stack) {
              return Text(err.toString());
            }, loading: () {
              return const CircularProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}
