import 'package:context/apis/tweet_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTweet extends ConsumerWidget {
  CreateTweet({super.key});

  final TextEditingController _tweetController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post a Tweet")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: _tweetController,
                maxLength: 280,
              ),
            ),
            TextButton(
              onPressed: () {
                ref.read(tweetProvider).postTweet(_tweetController.text);
                Navigator.pop(context);
              },
              child: const Text("Post Tweet"),
            )
          ],
        ),
      ),
    );
  }
}
