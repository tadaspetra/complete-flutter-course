import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:context/controllers/user_state.dart';
import 'package:context/models/tweet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tweetProvider = Provider<TweetApi>((ref) {
  return TweetApi(ref);
});

class TweetApi {
  TweetApi(this.ref);
  final Ref ref;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> postTweet(String tweet) async {
    LocalUser currentUser = ref.read(usersProvider);
    await _firestore.collection('tweets').add(Tweet(
          uid: currentUser.id,
          name: currentUser.user.name,
          profilePic: currentUser.user.profilePic,
          tweet: tweet,
        ).toMap());
  }
}
