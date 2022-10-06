import 'package:context/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalProvider = Provider<String>((ref) {
  return "I'm just a Normal Provider";
});

// user state for the app
final userProvider = FutureProvider.autoDispose.family<String, String>((ref, str) async {
  if (str == "secretstring") {
    return "Tadas is the best Instructor";
  }
  return ref.read(databaseProvider).getUserData();
});
