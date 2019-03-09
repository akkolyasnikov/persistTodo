
import 'package:bloc_ex/models/tasks.dart';
import 'package:bloc_ex/widgets/TodoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoList extends StatelessWidget {
  TodoList();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TaskRepository>(
      builder: (ctx, child, model) {
        return ListView.builder(
            itemCount: model.tasks.length,
            itemBuilder: (ctx, ind) => TodoWidget(
                  model: model.tasks[ind],
                ));
      },
    );
  }
}
