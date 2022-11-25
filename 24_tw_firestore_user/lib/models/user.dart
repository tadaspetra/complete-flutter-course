import 'dart:convert';

class FirebaseUser {
  final String email;

  const FirebaseUser({
    required this.email,
  });

  FirebaseUser copyWith({
    String? email,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));

  @override
  String toString() => 'FirebaseUser(email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseUser && other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
