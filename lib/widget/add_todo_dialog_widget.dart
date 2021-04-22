import 'package:flutter/material.dart';
import 'package:todo/widget/todo_form_widget.dart';

class AddToDoDialogWidget extends StatefulWidget {
  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
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
            onSavedTodo: () {}, //todo add function (call back from widget)
          )
        ],
      ),
    );
  }
}
