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
    AsyncValue<String> user = ref.watch(userProvider("secretstring"));

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.read(normalProvider)),
            Consumer(
              builder: ((context, ref, child) {
                return ref.watch(userProvider("wrongsecretstring")).maybeWhen(
                  data: (String value) {
                    return Text(value);
                  },
                  orElse: () {
                    return const CircularProgressIndicator();
                  },
                );
              }),
            ),
            user.maybeWhen(
              data: (String value) {
                return Text(value);
              },
              orElse: () {
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
