import 'package:bloc_ex/api/api.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class TaskRepository extends Model {
  TaskRepository(){
    PersistStorage.getTasksList().then((List<TaskItem>s){
      _tasks = s;
      
      notifyListeners();
    });
  }

  persistList(){
    PersistStorage.saveTasksList(_tasks);
  }
  List<TaskItem> _tasks = List();
  List<TaskModel> get tasks =>
      List.generate(_tasks.length, (index) => TaskModel(task: _tasks[index]));

   addTask(TaskItem task) {
    _tasks.add(task);
    notifyListeners();
    persistList();
  }
  removeTask(TaskItem task){
    _tasks.remove(task);
    notifyListeners();
    persistList();
  }

  static TaskRepository of(BuildContext context) =>
      ScopedModel.of<TaskRepository>(context);
}

TaskRepository TasksRep = TaskRepository();

class TaskItem {
  String title;
  bool isDone;
  TaskItem({@required this.isDone, @required this.title});
  makeUndone() {
    this.isDone = false;
    TasksRep.persistList();
  }

  makeDone() {
    this.isDone = true;
    TasksRep.persistList();
  }
}

class TaskModel extends Model {
  TaskItem task;
  TaskModel({this.task});
  toggleDone() {
    task.isDone ? task.makeUndone() : task.makeDone();
    notifyListeners();
    
  }
}
