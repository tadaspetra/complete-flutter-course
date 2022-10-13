import 'package:context/apis/tweet_api.dart';
import 'package:context/controllers/user_state.dart';
import 'package:context/pages/create.dart';
import 'package:context/pages/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/tweet.dart';

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
      body: ref.watch(feedProvider).when(
        data: (List<Tweet> data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, count) {
                return ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(data[count].profilePic),
                  ),
                  title: Text(
                    data[count].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data[count].tweet,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                );
              });
        },
        error: (Object error, StackTrace stackTrace) {
          return Container();
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateTweet(),
          ));
        },
        child: const Icon(Icons.add),
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
