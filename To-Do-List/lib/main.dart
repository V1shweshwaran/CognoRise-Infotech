import 'package:flutter/material.dart';
import 'to_do_list.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: ToDoList(),
    ),
  );
}
