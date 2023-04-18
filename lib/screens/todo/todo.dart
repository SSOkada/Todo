import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/todo_data.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final List<todoData> _todoList = [];
  final title = 'ToDoアプリ';

  void _todoAdd(String todo) {
    setState(() {
      _todoList.add(todoData(todo, false));
    });
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: _todoList.length,
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
                            title: Text(_todoList[index] != null
                                ? _todoList[index].name
                                : ''),
                            subtitle:
                                Text(_todoList[index].flg ? '達成済' : '未達成'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _todoList[index] != null
                                ? _todoList[index].flg
                                : false,
                            onChanged: (value) {
                              setState(() {
                                _todoList.removeAt(index);
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
          InputDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
