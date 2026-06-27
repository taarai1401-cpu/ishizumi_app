
import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final List<Question>? reviewList;
  const QuizScreen({super.key, this.reviewList});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _activeQuestions;
  int _currentIndex = 0;
  int _score = 0;
  final List<Question> _wrongQuestions = [];
  
  // インジケーター用の正誤記録リスト (null: 未回答, true: 正解, false: 不正解)
  late List<bool?> _progressResults;

  @override
  void initState() {
    super.initState();
    _activeQuestions = widget.reviewList ?? stoneQuestions;
    _progressResults = List<bool?>.filled(_activeQuestions.length, null);
  }

  void _checkAnswer(bool userChoice) {
    bool correct = _activeQuestions[_currentIndex].isCorrect == userChoice;
    
    setState(() {
      _progressResults[_currentIndex] = correct; // リアルタイムに〇×を記録
    });

    if (correct) {
      if (widget.reviewList == null) _score++;
    } else {
      if (!_wrongQuestions.contains(_activeQuestions[_currentIndex])) {
        _wrongQuestions.add(_activeQuestions[_currentIndex]);
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(correct ? '🎉 正解！' : '❌ 不正解...', style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text(_activeQuestions[_currentIndex].comment),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (_currentIndex < _activeQuestions.length - 1) {
                setState(() => _currentIndex++);
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(
                  score: _score,
                  total: _activeQuestions.length,
                  wrongQuestions: _wrongQuestions,
                  isReview: widget.reviewList != null,
                )));
              }
            },
            child: const Text('次の問題へ'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reviewList != null ? '復習修行' : '修行中'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          // 【新機能】問題番号インジケーター (1, 2, 3...)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_activeQuestions.length, (index) {
                  IconData icon = Icons.circle;
                  Color color = Colors.grey.shade300;
                  if (_progressResults[index] == true) {
                    icon = Icons.check_circle;
                    color = Colors.green;
                  } else if (_progressResults[index] == false) {
                    icon = Icons.cancel;
                    color = Colors.red;
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Text('${index + 1}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        Icon(icon, color: color, size: 30),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(_activeQuestions[_currentIndex].text, style: const TextStyle(fontSize: 22, height: 1.5)),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _answerButton('〇 正しい', Colors.green, true),
                        _answerButton('× 間違い', Colors.red, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _answerButton(String label, Color color, bool choice) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () => _checkAnswer(choice),
      child: Text(label, style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}