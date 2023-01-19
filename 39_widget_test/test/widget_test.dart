import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject/main.dart';
import 'package:miniproject/models/todo.dart';
import 'package:miniproject/pages/completed.dart';
import 'package:miniproject/pages/home.dart';
import 'package:miniproject/providers/todo_provider.dart';

void main() {
  testWidgets('default state', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // The state is `0` once again, with no tearDown/setUp needed
    expect(find.text('Add a todo using the button below'), findsOneWidget);
  });

  testWidgets('completed todos show up on completed page', (tester) async {
    TodoListNotifier notifier = TodoListNotifier(
        <Todo>[Todo(todoId: 0, content: "hello", completed: true)]);
    await tester.pumpWidget(ProviderScope(
      overrides: [
        todoProvider.overrideWith((ref) => notifier),
      ],
      child: const MaterialApp(
        home: CompletedTodo(),
      ),
    ));
    expect(find.text("hello"), findsOneWidget);
  });

  testWidgets('delete todo', (tester) async {
    TodoListNotifier notifier = TodoListNotifier(
        <Todo>[Todo(todoId: 0, content: "hello", completed: false)]);
    await tester.pumpWidget(ProviderScope(
      overrides: [
        todoProvider.overrideWith((ref) => notifier),
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    ));
    expect(find.text("hello"), findsOneWidget);

    await tester.timedDrag(find.byKey(const ValueKey("0")),
        const Offset(200, 0), const Duration(seconds: 1));
    await tester.tap(find.byKey(const ValueKey("0delete")));
    await tester.pump();
    expect(find.text("Add a todo using the button below"), findsOneWidget);
  });
}
