import 'package:flutter/material.dart';

import 'buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0.5,
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: 'Add new task',
              ),
            ),
          
            const SizedBox(height: 10,),

            Row(
              //save and cancel button
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: 'Cancel', onPressed: onCancel),
                MyButton(text: 'Save', onPressed: onSave),
              ],

            ),

            
          ],
        ),
      ),
    );
  }
}