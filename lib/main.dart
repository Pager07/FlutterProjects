
import 'package:flutter/material.dart';
import 'quizpage.dart';
// import 'models/question.dart';
// import 'mocks/mockdata.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(Quizller());

class Quizller extends StatelessWidget {

  const Quizller({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:Text('Quizller')),
        backgroundColor:Colors.white,
        body: QuizPage(),
        ),
    );
  }
}
