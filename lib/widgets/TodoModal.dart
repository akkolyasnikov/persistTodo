import 'package:bloc_ex/models/tasks.dart';
import 'package:flutter/material.dart';

class TodoAddButton extends StatelessWidget {
  TodoAddButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () => showDialog(
          context: context,
          builder: (ctx) => TodoAddModal(
                doneHandler: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 300),
                    content: Text(
                      'Задача добавлена',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ));
                },
              )),
    );
  }
}

class TodoAddModal extends StatefulWidget {
  TodoAddModal({@required this.doneHandler});
  final Function doneHandler;
  @override
  _TodoAddModalState createState() => _TodoAddModalState();
}

class _TodoAddModalState extends State<TodoAddModal> {
  TextEditingController _tasktitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      TasksRep.addTask(
                          TaskItem(isDone: false, title: _tasktitle.text));
                      if (Navigator.canPop(context)) {
                        _tasktitle.clear();
                        widget.doneHandler();
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
              TextField(
                maxLines: 5,
                controller: _tasktitle,
                decoration: InputDecoration(helperText: "Введите вашу задачу"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
