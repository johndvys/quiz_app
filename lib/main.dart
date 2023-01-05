import 'package:flutter/material.dart';
import 'package:quiz_app/score_keeper.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
ScoreKeeper scoreKeeper = ScoreKeeper();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage()),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Center(child: Text('Quiz App')),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                scoreKeeper.checkAnswer(true);
                setState(() {
                  if (quizBrain.isFinished() == true) {
                    quizBrain.reset();
                    scoreKeeper.clear();
                    Alert(
                            context: context,
                            title: "Congratulations",
                            desc: "You have finished the quiz.")
                        .show();
                  } else {
                    quizBrain.nextQuestion();
                  }
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                scoreKeeper.checkAnswer(false);
                setState(() {
                  if (quizBrain.isFinished() == true) {
                    quizBrain.reset();
                    scoreKeeper.clear();
                    Alert(
                            context: context,
                            title: "Congratulations",
                            desc: "You have finished the quiz.")
                        .show();
                  } else {
                    quizBrain.nextQuestion();
                  }
                });
              },
              child: const Text(
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                'False',
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper.scoreKeeper,
        ),
      ],
    );
  }
}
