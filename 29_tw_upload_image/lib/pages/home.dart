import 'package:context/controllers/user_state.dart';
import 'package:context/pages/settings.dart';
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
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                foregroundImage: NetworkImage(currentUser.user.profilePic),
                onForegroundImageError: (exception, stackTrace) {},
              ),
            ),
          );
        }),
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Text(currentUser.user.email),
          Text(currentUser.user.name),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Image.network(currentUser.user.profilePic),
            ListTile(
              title: Text(
                "Hello ${currentUser.user.name}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () async {
                await _auth.signOut();
                ref.read(usersProvider.notifier).logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
