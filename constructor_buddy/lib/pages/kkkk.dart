import 'package:constructor_buddy/Page_bar/Profile.dart';
import 'package:constructor_buddy/pages/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePagee extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todoP.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              // trailing: IconButton(
              //     icon: Icon(Icons.delete, color: Colors.red),
              //     onPressed: () {
              //       todoP.deleteTodo(todoP.todos[index]);
              //     }),
              title: Text(
                todoP.todos[index].mechanic_type,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                todoP.todos[index].mechanic_type,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Profile()));
          }),
    );
  }
}
