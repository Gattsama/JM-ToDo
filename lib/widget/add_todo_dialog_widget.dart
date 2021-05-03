import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos_provider.dart';
import 'package:todo/widget/todo_form_widget.dart';

class AddToDoDialogWidget extends StatefulWidget {
  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        description: description,
      );

      Provider.of<TodosProvider>(context, listen: false).add2TodoList(todo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ToDoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onDescriptionChanged: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: addTodo,
            )
          ],
        ),
      ),
    );
  }
}
