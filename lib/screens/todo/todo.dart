import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:helloworld/state/todo_provider.dart';
import 'package:provider/provider.dart';

import '../../compornets/input_dialog.dart';
import '../../model/todo_data.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final title = 'ToDoアプリ';

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoNotifier>(context);
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
            SizedBox(
              height: 500,
              width: 400,
              child: ListView.builder(
                itemCount: todoProvider.todoList.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Card(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text(todoProvider.todoList[index] != null
                                ? todoProvider.todoList[index].name
                                : ''),
                            subtitle: Text(todoProvider.todoList[index].flg
                                ? '達成済'
                                : '未達成'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: todoProvider.todoList[index] != null
                                ? todoProvider.todoList[index].flg
                                : false,
                            onChanged: (value) {
                              setState(() {
                                todoProvider.todoList.removeAt(index);
                              });
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
          InputDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
