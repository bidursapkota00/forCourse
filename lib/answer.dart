import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(
      {super.key, required this.selectHandler, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: selectHandler,
      child: Text(answerText),
    );
  }
}
