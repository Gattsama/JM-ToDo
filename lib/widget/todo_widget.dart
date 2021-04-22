import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todoItem;

  TodoWidget(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: todoItem.isDone,
            onChanged: (_) {}, //TODO ADD FUNCTION ON CHECKED
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoItem.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (todoItem.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todoItem.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
