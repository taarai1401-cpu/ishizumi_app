
import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final List<Question> wrongQuestions;
  final bool isReview;

  const ResultScreen({super.key, required this.score, required this.total, required this.wrongQuestions, required this.isReview});

  String _getRank() {
    if (score == 10) return '👑 石積み人間国宝';
    if (score >= 8) return '🛠️ 特級石積み職人';
    if (score >= 5) return '👷 一人前職人';
    return '🌱 石拾いさん';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('修行完了', style: TextStyle(fontSize: 24, color: Colors.grey)),
            const SizedBox(height: 10),
            Text(isReview ? '復習完了！' : '今回の結果', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            if (!isReview) ...[
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.brown, width: 8)),
                child: Text('$score / $total', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.brown)),
              ),
              const SizedBox(height: 30),
              Text(_getRank(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
            ],
            const SizedBox(height: 50),
            if (!isReview && wrongQuestions.isNotEmpty)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizScreen(reviewList: wrongQuestions))),
                icon: const Icon(Icons.history_edu, color: Colors.white),
                label: const Text('間違えた問題を復習する', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('タイトルへ戻る', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}