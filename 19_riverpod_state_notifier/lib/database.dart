import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) => Database());

class Database {
  Future<String> getUserData() {
    return Future.delayed(const Duration(seconds: 3), () {
      return "A message from the Future";
    });
  }

  int fakeDatabase = 0;

  Future<int> initDatabase() async {
    fakeDatabase = 0;
    return fakeDatabase;
  }

  Future<int> increment() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return fakeDatabase = fakeDatabase + 1;
    });
  }
}
