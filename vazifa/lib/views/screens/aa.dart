import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Savol 1',
      'answers': ['Javob 1', 'Javob 2', 'Javob 3']
    },
    {
      'question': 'Savol 2',
      'answers': ['Javob A', 'Javob B', 'Javob C']
    },
    {
      'question': 'Savol 3',
      'answers': ['Javob X', 'Javob Y', 'Javob Z']
    },
  ];

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      Navigator.of(context).push(_createRoute(_currentQuestionIndex));
    } else {
      // Savollar tugagach, biror amalni bajarish mumkin
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Savollar'),
      ),
      body: _buildQuestion(_questions[_currentQuestionIndex]),
    );
  }

  Widget _buildQuestion(Map<String, dynamic> question) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            question['question'] as String,
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          ...(question['answers'] as List<String>).map((answer) {
            return ElevatedButton(
              onPressed: _nextQuestion,
              child: Text(answer),
            );
          }).toList(),
        ],
      ),
    );
  }

  Route _createRoute(int questionIndex) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => QuestionScreen(),
      settings: RouteSettings(arguments: questionIndex),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset(0.0, 0.0);
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int? questionIndex =
        ModalRoute.of(context)?.settings.arguments as int?;
    if (questionIndex != null) {
      setState(() {
        _currentQuestionIndex = questionIndex;
      });
    }
  }
}
