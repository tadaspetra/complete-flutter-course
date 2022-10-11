import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:context/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, LocalUser>((ref) {
  return UsersNotifier();
});

class LocalUser {
  const LocalUser({required this.id, required this.user});

  final String id;
  final FirebaseUser user;

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }
}

class UsersNotifier extends StateNotifier<LocalUser> {
  UsersNotifier()
      : super(const LocalUser(
          id: "error",
          user: FirebaseUser(email: "error"),
        ));

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email) async {
    QuerySnapshot response = await _firestore
        .collection('user')
        .where('email', isEqualTo: email)
        .get();
    if (response.docs.isEmpty) {
      log("No firestore user associated to authenticated email $email");
      return;
    }
    if (response.docs.length != 1) {
      log("More than one firestore user associate with email: $email");
      return;
    }
    state =
        LocalUser(id: response.docs[0].id, user: FirebaseUser(email: email));
  }

  Future<void> signUp(String email) async {
    DocumentReference response = await _firestore.collection('user').add(
          FirebaseUser(email: email).toMap(),
        );
    state = LocalUser(id: response.id, user: FirebaseUser(email: email));
  }

  void logOut() {
    state = const LocalUser(
      id: "error",
      user: FirebaseUser(email: "error"),
    );
  }
}
