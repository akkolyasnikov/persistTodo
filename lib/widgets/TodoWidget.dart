import 'package:bloc_ex/models/tasks.dart';
import 'package:bloc_ex/widgets/TodoModalDetail.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoWidget extends StatelessWidget {
  final TaskModel model;
  TodoWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TaskModel>(
      model: model,
      child: ScopedModelDescendant<TaskModel>(
        builder: (ctx, child, model) {
          var formattedTitle = model.task.title.length > 30
              ? model.task.title.substring(0, 27) + "..."
              : model.task.title;

          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              TasksRep.removeTask(model.task);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Задача удалена",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));
            },
            key: Key("tm${model.task.title}"),
            child: ListTile(
              title: Text(
                formattedTitle,

                style: TextStyle(
                  decoration: model.task.isDone ? TextDecoration.lineThrough :TextDecoration.none,
                    color: model.task.isDone ? Colors.grey : Colors.black),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new TodoDetailButton(
                    model: model,
                  ),
                  IconButton(
                    onPressed: model.toggleDone,
                    icon: Icon(model.task.isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TodoDetailButton extends StatelessWidget {
  TaskModel model;

  TodoDetailButton({@required this.model});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => TodoModalDetail(
                  model: model,
                ));
      },
      icon: Icon(Icons.info_outline),
    );
  }
}
