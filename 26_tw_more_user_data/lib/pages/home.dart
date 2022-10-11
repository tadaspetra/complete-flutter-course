import 'package:context/controllers/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  Home({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocalUser currentUser = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          TextButton(
            onPressed: () async {
              await _auth.signOut();
              ref.read(usersProvider.notifier).logOut();
            },
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Text(currentUser.id),
          Text(currentUser.user.email),
          Text(currentUser.user.name ?? "No Name"),
          CircleAvatar(
            backgroundImage: currentUser.user.profilePic.isEmpty
                ? const NetworkImage("http://www.gravatar.com/avatar/?d=mp")
                : NetworkImage(currentUser.user.profilePic),
          ),
        ],
      ),
    );
  }
}
