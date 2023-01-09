import 'package:context/pages/create.dart';
import 'package:context/pages/settings.dart';
import 'package:context/providers/tweet_provider.dart';
import 'package:context/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../models/tweet.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<Home> {
  bool clicked = false;
  SMIInput<bool>? _pressed;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Button');
    artboard.addController(controller!);
    _pressed = controller.findInput("Press");
  }

  @override
  Widget build(BuildContext context) {
    LocalUser currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1,
          ),
        ),
        title: const Image(
          image: AssetImage('assets/twitter_blue.png'),
          width: 50,
        ),
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  currentUser.user.profilePic,
                ),
                onBackgroundImageError: (exception, stackTrace) {},
              ),
            ),
          );
        }),
        actions: [
          AnimatedOpacity(
            opacity: clicked ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 60,
                child: Image.asset("assets/mars.png"),
              ),
            ),
          )
        ],
      ),
      body: ref.watch(feedProvider).when(
          data: (List<Tweet> tweets) {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
              ),
              itemCount: tweets.length,
              itemBuilder: (context, count) {
                return ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                      tweets[count].profilePic,
                    ),
                  ),
                  title: Text(
                    tweets[count].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    tweets[count].tweet,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => const Center(
                child: Text("error"),
              ),
          loading: () => const CircularProgressIndicator()),
      drawer: Drawer(
          child: Column(
        children: [
          Image.network(
            currentUser.user.profilePic,
          ),
          ListTile(
            title: Text(
              "Hello, ${currentUser.user.name}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          ListTile(
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            title: const Text("Sign Out"),
            onTap: () {
              FirebaseAuth.instance.signOut();
              ref.read(userProvider.notifier).logout();
            },
          )
        ],
      )),
      floatingActionButton: AnimatedContainer(
        padding: const EdgeInsets.only(top: 90),
        alignment: clicked ? Alignment.topRight : Alignment.bottomRight,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          width: 100,
          height: 100,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                clicked = true;
              });
              _pressed?.value = true;
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const CreateTweet())));
                  setState(() {
                    clicked = false;
                  });
                });
              });
            },
            onTapCancel: () => _pressed?.value = false,
            onTapUp: (_) => _pressed?.value = false,
            child: RiveAnimation.asset(
              'assets/rocket.riv',
              onInit: _onRiveInit,
            ),
          ),
        ),
      ),
    );
  }
}
