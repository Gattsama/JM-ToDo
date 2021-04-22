import 'package:flutter/material.dart';
import 'package:todo/widget/add_todo_dialog_widget.dart';
import 'package:todo/widget/todo_list_widget.dart';

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
      Container(color: Colors.purple),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
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
              icon: Icon(Icons.fact_check_outlined), label: 'ToDo'),
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
