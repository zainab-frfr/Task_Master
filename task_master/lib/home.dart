import 'package:flutter/material.dart';
import 'todo_tiles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) { 
          return ToDoTile(taskName: todolist[index][0], taskCompleted: todolist[index][1], onChanged: (value)=>checkBoxChanged(index));
        },
      ),
    );
  }
}