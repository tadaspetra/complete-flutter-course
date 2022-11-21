import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalProvider = Provider<String>((ref) {
  return "I'm just a Normal Provider";
});

final messageProvider = FutureProvider<String>((ref) {
  return Future.delayed(const Duration(seconds: 5), () {
    return "A message from the Future";
  });
});
