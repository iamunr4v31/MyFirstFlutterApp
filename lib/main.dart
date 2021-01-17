import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answerText': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 0},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answerText': [
        {'text': 'Tiger', 'score': 9},
        {'text': 'skunk', 'score': 1},
        {'text': 'Lyca', 'score': 6},
        {'text': 'Wolf', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answerText': [
        {'text': 'Western Noodles', 'score': 9},
        {'text': 'Tsukumen', 'score': 1},
        {'text': 'Yakisoba', 'score': 6},
        {'text': 'Ramen', 'score': 4},
      ],
    },
  ];

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    // if (_questionIndex < _questions.length) {
    //   print("We have more _questions");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
