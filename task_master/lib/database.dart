import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todolist = [];

  
  // reference the box
  final _myBox = Hive.box('MyBox');

  //if first time opening app
  void createInitialData(){
    todolist = [
      ['Code',false],
      ['Eat', false],
    ];
  }

  //load data from database
  void loadData(){
    todolist = _myBox.get('TODOLIST');
  }

  //update database
  void updateData(){
    _myBox.put('TODOLIST', todolist);
  }
}