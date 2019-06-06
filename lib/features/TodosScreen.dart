import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Todo.dart';

import 'DetailScreen.dart';


class TodosScreen extends StatefulWidget {
    List<Todo> todos;

    TodosScreen({Key key, @required this.todos}) : super(key: key);

    @override
    State createState() => new DyanmicList(todos: todos);
}

class DyanmicList extends State<TodosScreen> {
    List<Todo> todos;
    DyanmicList({Key key, @required this.todos}) ;
    int counter;

    void _incrementCounter() {
        setState(() {
            todos.add(Todo("Added $todos.length", "$todos.length" ));
            // This call to setState tells the Flutter framework that something has
            // changed in this State, which causes it to rerun the build method below
            // so that the display can reflect the updated values. If we changed
            // _counter without calling setState(), then the build method would not be
            // called again, and so nothing would appear to happen.
           // _counter++;
           // todos.add
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Todos'),
            ),
            body: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(todos[index].title),
                        // When a user taps on the ListTile, navigate to the DetailScreen.
                        // Notice that we're not only creating a DetailScreen, we're
                        // also passing the current todo through to it!
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(todo: todos[index]),
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