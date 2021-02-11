import 'dart:convert';
import 'package:constructor_buddy/model/model.dart';
import 'package:flutter/material.dart';
// import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }

  List<Mechanic_Type> _todos = [];

  List<Mechanic_Type> get todos {
    return [..._todos];
  }

  // void addTodo(Mechanic_Type todo) async {
  //   final response = await http.post('https://constructor.pythonanywhere.com/api/Mechanic_Type/',
  //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
  //   if (response.statusCode == 201) {
  //     todo.mechanic_type = json.decode(response.body)['mechanic_type'];
  //     _todos.add(todo);
  //     notifyListeners();
  //   }
  // }

  // void deleteTodo(Mechanic_Type todo) async {
  //   final response =
  //       await http.delete('https://constructor.pythonanywhere.com/api/Mechanic_Type/${todo.mechanic_type}/');
  //   if (response.statusCode == 204) {
  //     _todos.remove(todo);
  //     notifyListeners();
  //   }
  // }

  fetchTasks() async {
    final url = 'https://constructor.pythonanywhere.com/api/Mechanic_Type/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as List;
      _todos = data.map<Mechanic_Type>((json) => Mechanic_Type.fromMap(json)).toList();
      notifyListeners();
    }
  }
//    void getProducts() async {
//     print('calling getProducts()');
//     String url = 'https://constructor.pythonanywhere.com/api/Product/';
//     var response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});
//     List<dynamic> result = json.decode(utf8.decode(response.bodyBytes));
//     _todos = result.map<Mechanic_Type>((data) => Mechanic_Type.fromMap(data)).toList();
//     // setState(() {});
//   }
}


 