import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos_provider.dart';
import 'package:todo/widget/add_todo_dialog_widget.dart';
import 'package:todo/widget/todo_list_widget.dart';
import 'package:todo/widget/completed_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedTodoListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .controller
                    .jumpTo(0);
              }),
          IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: () {
                Provider.of<TodosProvider>(context, listen: false)
                    .controller
                    .jumpTo(Provider.of<TodosProvider>(context, listen: false)
                        .controller
                        .position
                        .maxScrollExtent);
              })
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AddToDoDialogWidget();
              },
              barrierDismissible: false);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28.0,
              ),
              label: 'Completed')
        ],
      ),
    );
  }
}
