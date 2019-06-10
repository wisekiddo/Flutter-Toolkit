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

ScrollController scrollController;


class DynamicList extends State<TodoListScreen> {
  final List<Todo> todoList;

  DynamicList({Key key, @required this.todoList});

  void addTodo() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values.
    setState(() {
      //This will add new item to the list
      todoList.add(Todo("Added Todo ${todoList.length.toString()}",
          "A description of what needs to be done for Todo ${todoList.length.toString()}"));


      //This will scroll to the end of the list or to the new added item
      scrollController.animateTo(scrollController.position.maxScrollExtent ,
          curve: Curves.linear, duration: Duration(milliseconds: 400));
    });


  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
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
        icon: new Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.blur_on),
          onPressed: () {},
        )
      ],
    );

    final bottomNavigationBar = Container(
      height: 40.0,
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

    final listView = ListView.builder(
      itemCount: todoList.length,
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            todoList[index].title,
            textAlign: TextAlign.start,
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
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.album,
                color: Colors.blueGrey,
              ),
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

    //This will provide masking for the list elements
    final contentMask = Container(
      width: double.infinity,
      height: 20,
      child: Opacity(
        opacity: 1.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // We just need 1 color for start and end(alpha 0)
                Colors.lightBlueAccent,
                Colors.lightBlueAccent.withAlpha(0),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: FloatingActionButton(
          onPressed: addTodo,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: topAppBar,
        body: Stack(
          //The children sequence is important to achieve masking
          children: <Widget>[
            listView,
            Container(
              child: contentMask,
            ),
          ],
        ));
  }
}

