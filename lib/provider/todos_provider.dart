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
    Todo(
        createdTime: DateTime.now(),
        title: 'Mind Wipe Marlenea',
        description:
            '-Please tell me what to do, I can not think for myself\n-Please tell me what to do, I can not think on my own'),
    Todo(createdTime: DateTime.now(), title: 'Re-program Tsss'),
    Todo(createdTime: DateTime.now(), title: 'LAST'),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isDone == true).toList();

  final controller = ScrollController();

  add2TodoList(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  toogleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  updateToDoEdit(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
