class Question{
  String questionText;
  bool questionAnswere;
  Question({q, a}){
    questionText = q;
    questionAnswere = a;
  }
}

List<Question> questionBank = [
  Question(q:'This is Planet Earth', a: true),
  Question(q: 'We live in water',a: false),
  Question(q: 'Its Flutter', a: true),
];