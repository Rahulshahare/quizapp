import 'question.dart';
class QuizBrain{

  List<Question> questionBank = [
    Question(q:'This is Planet Earth', a: true),
    Question(q: 'We live in water',a: false),
    Question(q: 'Its Flutter', a: true),
  ];

  String getQuestion( int questionNumber){
    return questionBank[questionNumber].questionText;
  }

  bool getAnswere( int questionNumber){
    return questionBank[questionNumber].questionAnswere;
  }

}