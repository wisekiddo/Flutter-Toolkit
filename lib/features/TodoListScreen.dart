import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Todo.dart';

import 'DetailScreen.dart';

class TodoListScreen extends StatefulWidget {
  final List<Todo> todoList;
  final String headerTitle = "Flutter Toolkit";

  @DiagnosticLevel.debug
  TodoListScreen({Key key, @required this.todoList}) : super(key: key);

  @override
  State createState() => new DynamicList(todoList: todoList);
}

class DynamicList extends State<TodoListScreen> {
  final List<Todo> todoList;

  DynamicList({Key key, @required this.todoList});

  void addTodo() {
    setState(() {
      todoList.add(Todo("Added Todo ${todoList.length.toString()}",
          "A description of what needs to be done for Todo ${todoList.length.toString()}"));
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values.
    });
  }

  @override
  Widget build(BuildContext context) {
    //Custom app bar
    final topAppBar = AppBar(
      title: new Text(widget.headerTitle, textAlign: TextAlign.center),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: new IconButton(
        icon: new Icon(Icons.bookmark),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    final bottomNavigationBar = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );

    final ListView listView = ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            todoList[index].title,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white70),
          leading: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 1.0),
              alignment: Alignment.center,
              child: Icon(Icons.album, color: Colors.white70,),
            ),
          ),

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
            // Scrollable.ensureVisible(context);
          },
        );
      },
    );

    final Widget content =  Stack(

        //To have the control for AppBar
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
          ),

        listView,

          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: topAppBar,
          ),


        ],
      );

    final customScrollView = CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //HeaderWidget("Header 1"),
              //HeaderWidget("Header 2"),
              //HeaderWidget("Header 3"),
              //HeaderWidget("Header 4"),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //BodyWidget(Colors.blue),
              //BodyWidget(Colors.red),
              //BodyWidget(Colors.green),
              // BodyWidget(Colors.orange),
              //BodyWidget(Colors.blue),
              //BodyWidget(Colors.red),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              //BodyWidget(Colors.blue),
              //BodyWidget(Colors.green),
              // BodyWidget(Colors.yellow),
              //BodyWidget(Colors.orange),
              //BodyWidget(Colors.blue),
              //BodyWidget(Colors.red),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Colors.lightGreenAccent,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) => content)
    );
  }
}
