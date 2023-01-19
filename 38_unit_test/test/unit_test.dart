import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject/providers/todo_provider.dart';

void main() {
  late ProviderContainer container;
  late TodoListNotifier notifier;
  setUp(() {
    container = ProviderContainer();
    notifier = container.read(todoProvider.notifier);
  });

  test("Todo list starts empty", () {
    expect(notifier.debugState, []);
  });

  test("Add todo", () {
    notifier.addTodo("First Todo Item");
    expect(notifier.debugState[0].content, "First Todo Item");
  });

  test("Delete todo", () {
    notifier.addTodo("First Todo Item");
    expect(notifier.debugState[0].content, "First Todo Item");

    notifier.deleteTodo(0);
    expect(notifier.debugState, []);
  });

  test("Complete todo", () {
    notifier.addTodo("First Todo Item");
    expect(notifier.debugState[0].content, "First Todo Item");
    expect(notifier.debugState[0].completed, false);

    notifier.completeTodo(0);
    expect(notifier.debugState[0].completed, true);
  });
}
