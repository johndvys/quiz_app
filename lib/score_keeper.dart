import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class ScoreKeeper {
  final List<Icon> scoreKeeper = [];
  void clear() {
    scoreKeeper.clear();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }
}
