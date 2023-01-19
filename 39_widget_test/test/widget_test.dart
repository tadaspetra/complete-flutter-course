import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject/main.dart';
import 'package:miniproject/models/todo.dart';
import 'package:miniproject/pages/completed.dart';
import 'package:miniproject/pages/home.dart';
import 'package:miniproject/providers/todo_provider.dart';

void main() {
  testWidgets("default state", (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    Finder defaultText = find.text("Add a todo using the button below");

    expect(defaultText, findsOneWidget);
  });
  testWidgets("completed todos show up on completed page", (tester) async {
    TodoListNotifier notifier = TodoListNotifier(
      <Todo>[Todo(todoId: 0, content: "record video", completed: true)],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoProvider.overrideWith((ref) => notifier),
        ],
        child: const MaterialApp(home: CompletedTodo()),
      ),
    );
    Finder completedText = find.text("record video");

    expect(completedText, findsOneWidget);
  });

  testWidgets("slide and delete a todo", (tester) async {
    TodoListNotifier notifier = TodoListNotifier(
      <Todo>[Todo(todoId: 0, content: "record video", completed: false)],
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todoProvider.overrideWith((ref) => notifier),
        ],
        child: const MaterialApp(home: MyHomePage()),
      ),
    );
    Finder completedText = find.text("record video");

    expect(completedText, findsOneWidget);

    Finder draggableWidget = find.byKey(const ValueKey("0"));
    Finder deleteButton = find.byKey(const ValueKey("0delete"));
    await tester.timedDrag(
        draggableWidget, const Offset(200, 0), const Duration(seconds: 1));
    await tester.pump();
    await tester.tap(deleteButton);
    await tester.pump();

    Finder defaultText = find.text("Add a todo using the button below");
    expect(defaultText, findsOneWidget);
  });
}
