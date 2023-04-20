import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helloworld/main.dart';
import 'package:helloworld/state/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import '../../compornets/input_dialog.dart';
import '../../model/todo_data.dart';
import '../../state/test.dart';

final test = StateNotifierProvider<Test, String>((ref) => Test());

class ToDo extends HookConsumerWidget {
  final title = 'ToDoアプリ';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(ref.watch(test)),
            Text(ref
                .watch(todoProvider)[ref.watch(todoProvider).length - 1]
                .name),
            const Text(
              'タスク',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: ListView.builder(
                itemCount: ref.watch(todoProvider).length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  print('index');
                  print(index);
                  print(ref.watch(todoProvider).length);
                  return Card(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            activeColor: Colors.blue,
                            title: Text(ref.watch(todoProvider)[index] != null
                                ? ref.watch(todoProvider)[index].id.toString() +
                                    '     ' +
                                    ref.watch(todoProvider)[index].name
                                : ''),
                            subtitle: Text(ref.watch(todoProvider)[index].flg
                                ? '達成済'
                                : '未達成'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: ref.watch(todoProvider)[index] != null
                                ? ref.watch(todoProvider)[index].flg
                                : false,
                            onChanged: (value) {
                              // ref.watch(todoProvider)
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
          print(ref.watch(todoProvider).length);
          print('ref.watch(_todoProvider).length');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
