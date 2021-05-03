import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos_provider.dart';
import 'package:todo/widget/utils.dart';
import 'package:todo/page/edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo todoItem;

  TodoWidget(this.todoItem);

  @override
  Widget build(BuildContext context) {
    void deleteTodo(Todo todo) {
      Provider.of<TodosProvider>(context, listen: false).deleteTodo(todo);
      Utils.showSnackBar(context, 'Training Deleted');
    }

    void editTodo(BuildContext context, Todo todo) =>
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditToDos(todo: todo),
          ),
        );

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
            onTap: () => editTodo(context, todoItem),
          )
        ],
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => deleteTodo(todoItem),
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
                  final isDone =
                      Provider.of<TodosProvider>(context, listen: false)
                          .toogleTodoStatus(todoItem);
                  Utils.showSnackBar(
                      context,
                      isDone
                          ? 'Training Completed'
                          : 'Training is not yet complete');
                },
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
