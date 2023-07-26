import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'If the day after tomorrow is two days before Friday, what day is it today?',
      'answers': [
        {'text': 'Tuesday', 'score': 5},
        {'text': 'Wednesday', 'score': 3},
        {'text': 'Monday', 'score': 10},
        {'text': 'Thursday', 'score': 1},
      ]
    },
    {
      'questionText':
          'What comes next in the following series: 3, 6, 9, 12, ___?',
      'answers': [
        {'text': '18', 'score': 5},
        {'text': '21', 'score': 3},
        {'text': '24', 'score': 1},
        {'text': '15', 'score': 10},
      ]
    },
    {
      'questionText':
          'If all roses are flowers and some flowers fade quickly, can we conclude that some roses fade quickly?',
      'answers': [
        {'text': 'No', 'score': 5},
        {'text': 'Yes', 'score': 10},
      ]
    },
    {
      'questionText':
          'A shopkeeper sells an item for \$120, making a 20% profit. How much did the shopkeeper initially pay for the item?',
      'answers': [
        {'text': '\$110', 'score': 5},
        {'text': '\$105', 'score': 3},
        {'text': '\$100', 'score': 10},
        {'text': '\$115', 'score': 1},
      ]
    },
    {
      'questionText':
          'Which word does not fit in the following group: Apple, Banana, Orange, Pear, Carrot?',
      'answers': [
        {'text': 'Banana', 'score': 3},
        {'text': 'Carrot', 'score': 10},
        {'text': 'Orange', 'score': 1},
        {'text': 'Apple', 'score': 5},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // print(_questionIndex);
    // print(_questions[_questionIndex]);
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
