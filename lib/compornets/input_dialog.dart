import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../model/todo_data.dart';
import '../state/todo_provider.dart';

// final _todoProvider = StateNotifierProvider<TodoNotifier, List<todoData>>(
//     (ref) => TodoNotifier());

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

@override
Future<void> InputDialog(BuildContext context, WidgetRef ref) async {
  String todo = '';
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              ref.watch(todoProvider)[ref.watch(todoProvider).length - 1].name),
          content: TextField(
            decoration: InputDecoration(hintText: 'ここに入力'),
            onChanged: (value) => todo = value,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                todoData todoD =
                    todoData(ref.watch(todoProvider).length + 1, todo, false);
                ref.watch(todoProvider.notifier).addToDo(todoD);
                print('ref.watch(_todoProvider).length');
                print(ref.watch(todoProvider).length);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}
