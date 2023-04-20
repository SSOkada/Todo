import 'package:flutter/material.dart';

@immutable
class todoData {
  final int id;
  final String name;
  final bool flg;

  const todoData(this.id, this.name, this.flg);

  todoData copyWith({int? id, String? name, bool? flg}) {
    return todoData(id ?? this.id, name ?? this.name, flg ?? this.flg);
  }
}
