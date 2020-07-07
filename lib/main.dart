import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('QuizApp',
            style: TextStyle(
              //fontSize: 20.0,
              letterSpacing:1.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('TAP AGAIN TO EXIT', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),),
              ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoorKeeper = [];

  List<String> questions = [
    'This is Planet Earth',
    'We live above the sky',
    'Its after #2019',
  ];

  List<bool> answeres = [true, false, true];
  int questionNumber = 0;

  void _nextQuestion(){
    setState(() {
        if(questionNumber  <  questions.length - 1){
          questionNumber = questionNumber + 1;
        }else{
          questionNumber = 0;
        }
    });
  }

  void _updateScoor(bool userAnswere){
    bool correctAnswere = answeres[questionNumber];
    setState(() {
      scoorKeeper.add(
        Icon(
          correctAnswere == userAnswere ? Icons.check : Icons.close,
          color: correctAnswere == userAnswere ? Colors.green : Colors.red,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //TODO: a box is require to show question
          Expanded(
          flex: 3,
            child: Container(
                color: Colors.white30,
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                    questions[questionNumber],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                ),
            ),
          ),
          //TODO: a true button
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                textColor: Colors.white,
                color: Colors.white10,
                child: Text('TRUE',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing:2.0,
                  ),
                ),
                onPressed: (){
                  //DO on TRUE
                  _updateScoor(true);
                  _nextQuestion();
                },
              ),
            ),
          ),
          //TODO: a false button
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 4),
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                color: Colors.white10,
                textColor: Colors.white,
                child: Text('FALSE',
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing:2.0,
                  ),
                ),
                onPressed: (){
                  //DO on FALSE
                  _updateScoor(false);
                  _nextQuestion();
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoorKeeper,
          ),
        ],
      );
  }
}

