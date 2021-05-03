import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos_provider.dart';
import 'package:todo/widget/todo_form_widget.dart';
import 'package:todo/widget/utils.dart';

class EditToDos extends StatefulWidget {
  final Todo todo;

  EditToDos({this.todo});

  @override
  _EditToDosState createState() => _EditToDosState();
}

class _EditToDosState extends State<EditToDos> {
  String title;
  String description;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = widget.todo.title;
    description = widget.todo.description;
    super.initState();
  }

  void saveEditedToDo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      Provider.of<TodosProvider>(context, listen: false)
          .updateToDoEdit(widget.todo, title, description);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit Todo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () {
                      Provider.of<TodosProvider>(context, listen: false)
                          .deleteTodo(widget.todo);
                      Utils.showSnackBar(context, 'Training Deleted');
                      Navigator.pop(context);
                    })
              ],
            ),
            ToDoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onDescriptionChanged: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: saveEditedToDo,
            )
          ],
        ),
      ),
    );
  }
}
