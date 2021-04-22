import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'FIRST'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Train Tsss',
        description: '-Mind\n-Body\n-Soul'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Fuck Marlenea',
        description: '-Vaginal\n-Anal\n-Oral'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Mind Wipe Marlenea',
        description: '-Obedeance is pleasure\n-Listen & Obey\n-Exist to serve'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Re-program Tsss',
        description:
            '-Yes Sir\n-It would be Tsss\'s pleasure\n-Please teach Tsss'),
    Todo(createdTime: DateTime.now(), title: 'Train Tsss'),
    Todo(createdTime: DateTime.now(), title: 'Fuck Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Mind Wipe Marlenea'),
    Todo(createdTime: DateTime.now(), title: 'Re-program Tsss'),
    Todo(createdTime: DateTime.now(), title: 'LAST'),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  final controller = ScrollController();
}
