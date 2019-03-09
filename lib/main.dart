import 'package:bloc_ex/models/tasks.dart';
import 'package:bloc_ex/theme.dart';
import 'package:bloc_ex/widgets/TodoList.dart';
import 'package:bloc_ex/widgets/TodoModal.dart';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  TodoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: ScopedModel<TaskRepository>(
          model: TasksRep, child: TodoAppMainScreen()),
    );
  }
}

class TodoAppMainScreen extends StatelessWidget {
  TodoAppMainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoApp'),
        actions: <Widget>[new TodoAddButton()],
      ),
      body: TodoList(),
    );
  }
}

