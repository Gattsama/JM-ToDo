import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoWidget(
      Todo(
          createdTime: DateTime.now(),
          title: 'Walk the dog',
          description: 'Fuck Marlenea\nMind Wipe Marlenea\nTrain Marlenea'),
    );
  }
}
