import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../model/todo_data.dart';

class Test extends StateNotifier<String> {
  Test() : super('test');
  void addToDo(String value) {
    state = value;
  }
}
