import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result({
    super.key,
    required this.resultScore,
    required this.resetHandler,
  });

  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'Your IQ is very bad';
    } else if (resultScore <= 20) {
      resultText = 'Your IQ is bad';
    } else if (resultScore <= 30) {
      resultText = 'Your IQ is fair';
    } else if (resultScore <= 40) {
      resultText = 'Your IQ is good';
    } else {
      resultText = 'Your IQ is Excellent';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: resetHandler,
            child: const Text(
              'Restart Quiz!',
            ),
          ),
        ],
      ),
    );
  }
}
