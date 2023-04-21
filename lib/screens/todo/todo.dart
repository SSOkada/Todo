import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helloworld/main.dart';
import 'package:helloworld/state/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../compornets/input_dialog.dart';
import '../../model/todo_data.dart';
import '../../state/test.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final test = StateNotifierProvider<Test, String>((ref) => Test());

class ToDo extends HookConsumerWidget {
  final title = 'ToDoアプリ';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newTodoController = useTextEditingController();
    ValueNotifier<List<todoData>> todoList = useState(ref.watch(todoProvider));
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'タスク',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              margin: const EdgeInsets.all(2.5),
              child: SizedBox(
                width: 400,
                child: TextField(
                  controller: newTodoController,
                  decoration: const InputDecoration(
                    labelText: 'What needs to be done?',
                  ),
                  onChanged: (value) {
                    todoList.value =
                        ref.read(todoProvider.notifier).filterTodo(value);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: ListView.builder(
                itemCount: todoList.value.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  print('index');
                  print(index);
                  print(todoList.value.length);
                  return Card(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text(todoList.value[index] != null
                                ? todoList.value[index].id.toString() +
                                    '     ' +
                                    todoList.value[index].name
                                : ''),
                            subtitle:
                                Text(todoList.value[index].flg ? '達成済' : '未達成'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: todoList.value[index] != null
                                ? todoList.value[index].flg
                                : false,
                            onChanged: (value) {
                              ref
                                  .watch(todoProvider.notifier)
                                  .deleteTodo(index);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('クリック');
          ref.read(test.notifier).addToDo('oooo');
          InputDialog(context, ref);
          print(todoList.value.length);
          print('ref.watch(_todoProvider).length');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
