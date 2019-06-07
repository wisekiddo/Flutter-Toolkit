import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Todo.dart';

import 'DetailScreen.dart';


class TodoListScreen extends StatefulWidget {

    final List<Todo> todoList;

    TodoListScreen({Key key, @required this.todoList}) : super(key: key);

    @override
    State createState() => new DynamicList(todoList: todoList);
}

class DynamicList extends State<TodoListScreen> {

    final List<Todo> todoList;
    DynamicList({Key key, @required this.todoList}) ;

    void _incrementCounter() {
        setState(() {
            todoList.add(Todo("Added Todo ${todoList.length.toString()}",
                   "A description of what needs to be done for Todo ${todoList.length.toString()}" ));
            // This call to setState tells the Flutter framework that something has
            // changed in this State, which causes it to rerun the build method below
            // so that the display can reflect the updated values. 
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Todos'),
            ),
            body: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(todoList[index].title),
                        // When a user taps on the ListTile, navigate to the DetailScreen.
                        // Notice that we're not only creating a DetailScreen, we're
                        // also passing the current todo through to it!
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(todo: todoList[index]),
                                ),
                            );
                        },
                    );
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}