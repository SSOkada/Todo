import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../state/todo_provider.dart';

@override
Future<void> InputDialog(BuildContext context) async {
  String todo = '';
  final todoProvider = Provider.of<TodoNotifier>(context, listen: false);
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ToDo Add'),
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
                todoProvider.todoAdd(todo);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}
