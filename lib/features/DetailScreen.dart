import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Todo.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
      appBar: AppBar(
        title: Text(todo.title),
      ),
    );
  }
}
