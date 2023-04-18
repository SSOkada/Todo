import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo_data.dart';

class TodoNotifier with ChangeNotifier {
  final List<todoData> _todoList = [];

  List<todoData> get todoList => _todoList;

  void todoAdd(String todo) {
    _todoList.add(todoData(todo, false));
    notifyListeners();
  }

  void todoRemove(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider<TodoNotifier>(create: (ref) {
  return TodoNotifier();
});
