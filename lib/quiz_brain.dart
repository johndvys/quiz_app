import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(q: 'The sky is blue, because of the ocean', a: true),
    Question(q: 'The number 10 is less than the number 7', a: false),
    Question(q: 'The green button is True', a: true),
    Question(q: 'Wyatt\'s age is 10', a: false),
    Question(q: 'What button is red?', a: false),
    Question(q: '10 > 9', a: true),
    Question(q: 'Love is blind', a: false),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    if (isFinished() == true) {
      _questionNumber = 0;
      print('finished');
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
