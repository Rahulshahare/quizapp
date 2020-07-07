import 'package:QuizApp/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'question.dart';
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
//  List<Question> questionBank = [
//    Question(q:'This is Planet Earth', a: true),
//    Question(q: 'We live in water',a: false),
//    Question(q: 'Its Flutter', a: true),
//  ];

  int questionNumber = 0;
  bool isFinish = false;

  void _reset(){
    setState(() {
      questionNumber = 0;
      isFinish = false;
      scoorKeeper = [];
    });
  }

  void _nextQuestion(){
        if(questionNumber  <  questionBank.length - 1){
          setState(() {
            questionNumber = questionNumber + 1;
          });
        }else{
          isFinish = true;
          _showAlert();
        }
  }

  void _updateScoor(bool userAnswere){
    if(isFinish){
      return null;
    }
    bool correctAnswere = questionBank[questionNumber].questionAnswere;
    setState(() {
      scoorKeeper.add(
        Icon(
          correctAnswere == userAnswere ? Icons.check : Icons.close,
          color: correctAnswere == userAnswere ? Colors.green : Colors.red,
          size: 20.0,
        ),
      );
    });
  }

  void _showAlert(){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/undraw_yoga.png", width: 200.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hope you loved it',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: FlatButton(
                        onPressed: () {
                          _reset();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "LOVE IT",
                          style: TextStyle(color: Colors.white, letterSpacing: 2.0),
                        ),
                        color: CupertinoColors.black,
                      ),
                    )
                  ],
                ),
              ),
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
                    questionBank[questionNumber].questionText,
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

