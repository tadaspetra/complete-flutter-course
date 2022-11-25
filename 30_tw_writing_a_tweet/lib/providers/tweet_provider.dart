import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:context/models/tweet.dart';
import 'package:context/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tweetProvider = Provider<TwitterApi>((ref) {
  return TwitterApi(ref);
});

class TwitterApi {
  TwitterApi(this.ref);
  final Ref ref;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> postTweet(String tweet) async {
    LocalUser currentUser = ref.read(userProvider);
    await _firestore.collection('tweets').add(
          Tweet(
            uid: currentUser.id,
            profilePic: currentUser.user.profilePic,
            name: currentUser.user.name,
            tweet: tweet,
            postTime: Timestamp.now(),
          ).toMap(),
        );
  }
}
