import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizApp'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //TODO: a box is require to show question
            Expanded(
              child: Text('Question is here'),
            ),
            //TODO: a true button
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                color: Colors.green,
                child: Text('TRUE'),
                onPressed: (){
                  //DO on TRUE
                },
              ),
            ),
            //TODO: a false button
            Expanded(
              child: FlatButton(
                child: Text('FALSE'),
                onPressed: (){
                  //DO on FALSE
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

