import 'package:flutter/material.dart';
import 'package:task_master/dialog_box.dart';
import 'todo_tiles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //text controller
  final _controller = TextEditingController();

  List todolist = [
    ['code!',false],
    ['work out',false],
  ];

  //checkbox is tapped
  void checkBoxChanged(int index){
    setState(() {
      todolist[index][1] = !todolist[index][1]; 
    });
  }

  //save new task
  void saveNewTask(){
    setState(() {
      todolist.add([_controller.text,false]);
    });

    Navigator.of(context).pop();
    _controller.clear();
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
      todolist.removeAt(index);   
    });
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
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) { 
          return ToDoTile(taskName: todolist[index][0], taskCompleted: todolist[index][1], onChanged: (value)=>checkBoxChanged(index), deleteFunction: (context)=>deleteTask(index),);
        },
      ),
    );
  }
}