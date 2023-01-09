import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  final String uid;
  final String profilePic;
  final String name;
  final String tweet;
  final Timestamp postTime;

  Tweet({
    required this.uid,
    required this.profilePic,
    required this.name,
    required this.tweet,
    required this.postTime,
  });

  Tweet copyWith({
    String? uid,
    String? profilePic,
    String? name,
    String? tweet,
    Timestamp? postTime,
  }) {
    return Tweet(
      uid: uid ?? this.uid,
      profilePic: profilePic ?? this.profilePic,
      name: name ?? this.name,
      tweet: tweet ?? this.tweet,
      postTime: postTime ?? this.postTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'profilePic': profilePic,
      'name': name,
      'tweet': tweet,
      'postTime': postTime,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      name: map['name'] ?? '',
      tweet: map['tweet'] ?? '',
      postTime: map['postTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tweet.fromJson(String source) => Tweet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tweet(uid: $uid, profilePic: $profilePic, name: $name, tweet: $tweet, postTime: $postTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tweet &&
        other.uid == uid &&
        other.profilePic == profilePic &&
        other.name == name &&
        other.tweet == tweet &&
        other.postTime == postTime;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        profilePic.hashCode ^
        name.hashCode ^
        tweet.hashCode ^
        postTime.hashCode;
  }
}
