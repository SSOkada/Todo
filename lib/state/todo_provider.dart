import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../model/todo_data.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<todoData>>(
    (ref) => TodoNotifier());

class TodoNotifier extends StateNotifier<List<todoData>> {
  TodoNotifier() : super([todoData(1, 'aa', false)]);
  void addToDo(todoData todo) {
    state = [...state, todo];
  }

  void deleteTodo(int index) {
    state = List.from(state)..removeAt(index);
  }

  int nextId() {
    int id = 0;
    state.forEach((todo) {
      if (todo.id > id) {
        id = todo.id;
      }
    });
    id++;
    return id;
  }
}
