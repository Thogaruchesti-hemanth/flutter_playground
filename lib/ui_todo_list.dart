import 'package:flutter/material.dart';

class TodoListList extends StatefulWidget {
  const TodoListList({super.key});

  @override
  State<TodoListList> createState() => _TodoListListState();
}

class _TodoListListState extends State<TodoListList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("name"));
  }
}
