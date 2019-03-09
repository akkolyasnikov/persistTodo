import 'dart:convert';

import 'package:bloc_ex/models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistStorage {
  
  static Future<List<TaskItem>> getTasksList()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List rawItems = prefs.getStringList("todo");
    if(rawItems == null){
      return List<TaskItem>();
    }
    List<TaskItem> items = List.generate(rawItems.length, (index){
      var task = jsonDecode(rawItems[index]);
      return TaskItem(
        isDone: task['isDone'],
        title: task['title']
      );
    });
    return items;
  }
  static void saveTasksList(List<TaskItem> items)async{
    List<String> stringList = List.generate(items.length, (index){
      return jsonEncode({
        'title': items[index].title,
        'isDone': items[index].isDone
      });
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("todo",stringList);
  }
}