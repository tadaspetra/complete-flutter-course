import 'dart:convert';

class Tweet {
  final String uid;
  final String profilePic;
  final String name;
  final String tweet;

  Tweet({
    required this.uid,
    required this.profilePic,
    required this.name,
    required this.tweet,
  });

  Tweet copyWith({
    String? uid,
    String? profilePic,
    String? name,
    String? tweet,
  }) {
    return Tweet(
      uid: uid ?? this.uid,
      profilePic: profilePic ?? this.profilePic,
      name: name ?? this.name,
      tweet: tweet ?? this.tweet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'profilePic': profilePic,
      'name': name,
      'tweet': tweet,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      name: map['name'] ?? '',
      tweet: map['tweet'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Tweet.fromJson(String source) => Tweet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tweet(uid: $uid, profilePic: $profilePic, name: $name, tweet: $tweet)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tweet &&
        other.uid == uid &&
        other.profilePic == profilePic &&
        other.name == name &&
        other.tweet == tweet;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ profilePic.hashCode ^ name.hashCode ^ tweet.hashCode;
  }
}
