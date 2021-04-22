import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos_provider.dart';
import 'package:todo/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
            'No ToDos Today',
            style: TextStyle(fontSize: 30),
          ))
        : ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 10),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return TodoWidget(todo);
            },
          );
  }
}
