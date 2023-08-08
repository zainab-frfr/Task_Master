import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_master/database.dart';
import 'package:task_master/dialog_box.dart';
import 'todo_tiles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // reference the box
  final _myBox = Hive.box('MyBox');

  @override
  void initState() {
    // if first time ever opening app then create default data
    if(_myBox.get('TODOLIST')==null){
      db.createInitialData();
    }
    else{
      //there already exists data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //database list
  ToDoDatabase db = ToDoDatabase();

  //checkbox is tapped
  void checkBoxChanged(int index){
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1]; 
    });
    db.updateData();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.todolist.add([_controller.text,false]);
    });

    Navigator.of(context).pop();
    _controller.clear();
    db.updateData();
  }

  //new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
          onSave: saveNewTask,
        );
      }
    );
  }

  //delete task 
  void deleteTask(int index){
    setState(() {
      db.todolist.removeAt(index);   
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TO DO',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        elevation: 0.5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        elevation: 0.5,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (BuildContext context, int index) { 
          return ToDoTile(taskName: db.todolist[index][0], taskCompleted: db.todolist[index][1], onChanged: (value)=>checkBoxChanged(index), deleteFunction: (context)=>deleteTask(index),);
        },
      ),
    );
  }
}