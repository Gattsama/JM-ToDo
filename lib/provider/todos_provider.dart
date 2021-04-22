import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Train Tsss'),
    Todo(createdTime: DateTime.now(), title: 'Fuck Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Mind Wipe Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Re-program Tsss'),
    Todo(createdTime: DateTime.now(), title: 'Train Tsss'),
    Todo(createdTime: DateTime.now(), title: 'Fuck Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Mind Wipe Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Re-program Tsss'),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
