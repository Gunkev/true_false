import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Quiz_Brain.dart';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';



QuizBrain quizBrain = new QuizBrain();

void main() => runApp(Quizzes());

class Quizzes extends StatelessWidget {
  @override
  Widget build(BuildContext  context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Quiz'),
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Quiz(),
            ),
          ),
        ),
      ),
    );
  }
}


class  Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //keep track of user answer
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    // keep track of actual answer of user and compares it to true then output the result
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if(quizBrain.isFinished() == true ) {
        Alert(
          image: Image.asset("images/cry.png",
            height: 100.0,
            width: 100.0,
          ),
          context: context,
          title: 'End',
          desc: 'You have reached the end of the quiz. You scored  quizBrain.count() /10',
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              onPressed: () =>
              // restart quiz
              quizBrain.reset(),
              color: Colors.deepPurple,
            ),
            DialogButton(
              child: Text(
                "Quit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: ()=> exit(0),
              color: Colors.red,
            )
          ],
        ).show();
        // empty score keeper
        scoreKeeper = [];
      }

      else {
        if (userAnswer == correctAnswer) {
          final player = AudioCache();
          player.play('soundsilk-Correct-Answer-Soundeffect.mp3');
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.deepPurple,
            size: 18.0,
          ));
          quizBrain.count();
        } else {
          final player = AudioCache();
          player.play('soundsilk-buzzer-wrong-answer.mp3');
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
            size: 18.0,
          ));
        }
        // on click move to the next question
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                // print actual question on screen
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Source Sans Pro',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: RaisedButton(
              textColor: Colors.white,
              child: Text(
                'True',
              ),
              onPressed: (){
                checkAnswer(true);
                },
              color: Colors.deepPurple,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
              textColor: Colors.white,
              child: Text(
                'False',
              ),
              onPressed: (){
                checkAnswer(false);
                },
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
      ],
    );
  }
}




