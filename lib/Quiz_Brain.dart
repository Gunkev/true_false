import 'Question.dart';

class QuizBrain {

  //index for question number
  int _questionNumber = 0;
  // count correct answer
  int _counter = 0;

  // list of questions and corresponding answers
  List<Question> _questionList = [
    Question(' \"Life is not a game of luck if you wanna win, work hard\",  Dongtea said this.', false),
    Question(' Demon Slayer is equivalent to  \"Kimetsu no yaiba\"  in japanese.', true),
    Question(' Meliodas said this  \"To understand pain you must know it\".' ,false),
    Question(' \"Religion, ideology, resources, land, spite, love, or just because. No matter pathetic the reason, it\'s enough to start a war \"   was said by pain.',true),
    Question(' \"You don\'t become the Hokage to be acknowledge by everyone. The one who is acknowleged by everyone becomes the Hokage \".  Sasuke said this to Naruto',false),
    Question(' \"Fire is not evil. It\'s knowing your weakness, and making you strong\"  are words from Gildarts Clive in fairy tail.',true),
    Question('Rangiku said this  \"To know sorrow is not terrifying. What is terrifying is to know you can\'t go back to happiness you could have\" ',true),
    Question(' \"It\'s just pathetic to give up on something before even give it a shot\"  Reiko Mikami from Another.',true),
    Question(' \"If you can\'t find a reason to fight, then you shouldn\"  be fighting\' Naruto.',false),
    Question(' \"Human beings are strong because we can change ourselves\",  Saitama.',true),
  ];

  void nextQuestion() {
    if(_questionNumber < _questionList.length - 1) {
      _questionNumber++;
      print(_questionNumber);
      print(_questionList.length);
    }
  }

  String getQuestion() {
    return _questionList[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionList[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if(_questionNumber >=  _questionList.length - 1) {
      print(_questionNumber);
      return true;
    }
    else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void count() {
    _counter++;
    print('your score is: $_counter');
  }
}