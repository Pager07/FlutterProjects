import 'package:flutter/material.dart';
import 'models/question.dart';
import 'mocks/mockdata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//Next start assignment 2

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var scoreTracker = <Icon>[];
  static List<Question> questions = MockQuestions.fetchQuestions();
  var trueIcon = Icon(Icons.done, color: Colors.green);
  var falseIcon = Icon(Icons.close, color: Colors.red);
  int length = questions.length;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return _renderPage();
  }

  Widget _renderPage() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _renderText('Question Text here'),
          _renderButton('True', Colors.green, true),
          _renderButton('BullShit', Colors.red, false),
          _renderIcons(),
          
        ]);
  }

  Widget _renderText(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            questions[count].questionText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
        ),
      ),
    );
  }



  Widget _renderButton(String text, Color color, bool buttonType) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          onPressed: () => this.buttonPressed(buttonType),
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          style: TextButton.styleFrom(
              textStyle: TextStyle(
            fontSize: 30,
            backgroundColor: color,
            // backgroundColor:Colors.blue
          )),
        ),
      ),
    );
  }
   void buttonPressed(buttonType) {
    buttonType == questions[count].answer
        ? scoreTracker.add(trueIcon)
        : scoreTracker.add(falseIcon);
    setState(() {
      if (count == length - 1) {
        _showAlert();
        scoreTracker.clear();
      }
      count = (count + 1) % length;
    });
  }
  _showAlert() {
    Alert(
      context: context, 
      type: AlertType.success,
      title: "Game End",
      desc: "Click Restart button to restart the game!",
      buttons: [
        DialogButton(
          child: Text(
            "Restart",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    print('Showing Alert');
  }

  _renderIcons() {
    return Row(
      children: scoreTracker,
    );
  }
}
