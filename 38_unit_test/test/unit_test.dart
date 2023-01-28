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

  test('add todo', () {
    notifier.addTodo("record video");
    expect(notifier.debugState[0].content, "record video");
  });

  test('todo list starts empty', () {
    expect(notifier.debugState, []);
  });

  test('delete todo', () {
    notifier.addTodo("record video");
    expect(notifier.debugState[0].content, "record video");

    notifier.deleteTodo(0);
    expect(notifier.debugState, []);
  });

  test('complete todo', () {
    notifier.addTodo("record video");
    expect(notifier.debugState[0].content, "record video");
    expect(notifier.debugState[0].completed, false);

    notifier.completeTodo(0);
    expect(notifier.debugState[0].completed, true);
  });
}
