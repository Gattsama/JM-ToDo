import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onDescriptionChanged;
  final VoidCallback onSavedTodo;

  ToDoFormWidget(
      {this.title,
      this.description,
      @required this.onChangedTitle,
      @required this.onDescriptionChanged,
      @required this.onSavedTodo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 10),
          buildDescripton(),
          SizedBox(height: 32),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The Title Can Not be Empty';
          }
          return null;
        },
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      );

  Widget buildDescripton() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onDescriptionChanged,
        decoration: InputDecoration(
          labelText: 'Description',
          border: UnderlineInputBorder(),
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: onSavedTodo,
            child: Text('Save')),
      );
}
