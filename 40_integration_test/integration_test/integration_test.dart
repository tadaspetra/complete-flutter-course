import 'package:context/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('log in, check for tweet, log out', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Log in to Twitter'), findsOneWidget);

      final Finder loginEmail = find.byKey(const ValueKey('loginEmail'));
      final Finder loginPassword = find.byKey(const ValueKey('loginPassword'));
      final Finder loginButton = find.byKey(const ValueKey('login'));

      await tester.enterText(loginEmail, "tadas4@gmail.com");
      await tester.enterText(loginPassword, "123456");
      await tester.tap(loginButton);

      await tester.pumpAndSettle();

      expect(find.text('Tadas Petra'), findsOneWidget);

      final Finder navBar = find.byKey(const ValueKey('navBar'));
      final Finder signOut = find.byKey(const ValueKey('signOut'));

      await tester.tap(navBar);
      await tester.pumpAndSettle();

      await tester.tap(signOut);
      await tester.pumpAndSettle();

      expect(find.text('Log in to Twitter'), findsOneWidget);
    });
  });
}
