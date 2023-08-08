import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onPressed});

  final String text; 
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.5,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}