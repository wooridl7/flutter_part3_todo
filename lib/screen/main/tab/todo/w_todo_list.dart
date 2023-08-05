import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';

import '../../../../data/memory/todo_data_holder.dart';
import '../../../../data/memory/vo_todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.todoDataHolder.todoDataChangeNotifier,
      builder: (BuildContext context, List<Todo> todoList, Widget? child) {
        return todoList.isEmpty
            ? '할일을 작성해보세요'.text.size(30).makeCentered()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: todoList
                      .map((e) => TodoItem(
                            todo: e,
                          ))
                      .toList(),
                ),
              );
      },
    );
  }
}