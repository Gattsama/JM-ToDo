import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todoItem;

  TodoWidget(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        key: Key(todoItem.id),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
            caption: 'Edit',
            color: Colors.green,
            icon: Icons.edit,
            onTap: () {},
          )
        ],
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {},
          )
        ],
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todoItem.isDone,
                onChanged: (_) {
                  print('checked');
                  todoItem.isDone = !todoItem.isDone;
                  print(todoItem.isDone);
                }, //TODO ADD FUNCTION ON CHECKED
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
        ),
      ),
    );
  }
}
