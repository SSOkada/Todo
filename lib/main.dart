import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  Future<void> InputDialog(BuildContext context) async {
    String todo = '';
    return showDialog(
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
                  _todoAdd(todo);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }
}

class todoData {
  String name;
  bool flg;

  todoData(this.name, this.flg);
}
