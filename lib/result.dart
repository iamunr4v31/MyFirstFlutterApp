import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _resultScore;
  final Function _resetQuiz;
  Result(this._resultScore, this._resetQuiz);

  String get resultPhrase {
    String resultText;
    if (_resultScore <= 8) {
      resultText = 'You are innocent';
    } else if (_resultScore <= 12) {
      resultText = 'Pretty Likable';
    } else if (_resultScore <= 16) {
      resultText = 'You are Strange';
    } else {
      resultText = 'You are bad';
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
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Reset'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _resetQuiz,
          ),
        ],
      ),
    );
  }
}
