import 'package:bloc_ex/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoModalDetail extends StatefulWidget {
  TaskModel model;
  TodoModalDetail({@required this.model});

  @override
  _TodoModalDetailState createState() => _TodoModalDetailState();
}

class _TodoModalDetailState extends State<TodoModalDetail> {
  toggleDone() {
    widget.model.toggleDone();
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  removeTask() {
    TasksRep.removeTask(widget.model.task);
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.model.task.title),
          Row(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(widget.model.task.isDone ? Icons.close : Icons.check,
                    color:
                        widget.model.task.isDone ? Colors.grey : Colors.green),
                label: Text(
                  widget.model.task.isDone ? 'Не выполнено' : 'Выполнить',
                  style: TextStyle(
                      color: widget.model.task.isDone
                          ? Colors.grey
                          : Colors.green),
                ),
                onPressed: toggleDone,
              ),
              FlatButton.icon(
                icon: Icon(Icons.delete, color: Colors.red),
                label: Text(
                  'Удалить',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: removeTask,
              )
            ],
          )
        ],
      ),
    ));
  }
}
