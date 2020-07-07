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

  List<Icon> scoorKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                          'Are we Learning Flutter?',
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
                        setState(() {
                          scoorKeeper.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        });
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
                        setState(() {
                          scoorKeeper.add(
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          );
                        });

                      },
                    ),
                  ),
                ),
                Row(
                  children: scoorKeeper,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

