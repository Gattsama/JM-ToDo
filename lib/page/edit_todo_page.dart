import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widget/todo_form_widget.dart';

class EditToDos extends StatefulWidget {
  final Todo todo;

  EditToDos({this.todo});

  @override
  _EditToDosState createState() => _EditToDosState();
}

class _EditToDosState extends State<EditToDos> {
  String title;
  String description;

  @override
  void initState() {
    title = widget.todo.title;
    description = widget.todo.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Edit Todo'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ToDoFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title) {
                  setState(() {
                    this.title = title;
                  });
                },
                onDescriptionChanged: (description) {
                  setState(() {
                    this.description = description;
                  });
                },
                onSavedTodo: () {}),
          )),
    );
  }
}
