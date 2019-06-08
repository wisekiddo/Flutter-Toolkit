
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/TodoListScreen.dart';
import 'models/Todo.dart';
import 'utils/DeviceInfo.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    DeviceInfo.getInformation().then((Specification spec) {
      debugPrint('Manufacturer: ${spec.manufacturer}');
      debugPrint('Device: ${spec.device}');
      debugPrint('Model: ${spec.model}');
    });

    return MaterialApp(
      title: 'Wisekiddo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in theconsole where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(todoList: List.generate(20, (i) => Todo(
        'Todo $i',
        'A description of what needs to be done for Todo $i',
      ),
    ),
    ),
    );
  }
}


