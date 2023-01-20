import 'package:context/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("log in, check for tweet, log out", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    Finder loginText = find.text("Log in to Twitter");
    expect(loginText, findsOneWidget);

    Finder loginEmail = find.byKey(const ValueKey("loginEmail"));
    Finder loginPassword = find.byKey(const ValueKey("loginPassword"));
    Finder loginButton = find.byKey(const ValueKey("loginButton"));
    Finder profilePic = find.byKey(const ValueKey("profilePic"));
    Finder signOut = find.byKey(const ValueKey("signOut"));

    await tester.enterText(loginEmail, "tadas4@gmail.com");
    await tester.enterText(loginPassword, "123456");
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder tweetName = find.text("Tadas Petra");
    expect(tweetName, findsOneWidget);

    await tester.tap(profilePic);
    await tester.pumpAndSettle();

    await tester.tap(signOut);
    await tester.pumpAndSettle();

    expect(loginText, findsOneWidget);
  });
}
