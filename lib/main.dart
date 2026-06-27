
import 'package:flutter/material.dart';
import 'package:ishizumi_app/screens/home_screen.dart'; // 👈 ここをこの通りに書き換えて（または付け足して）ください！

void main() => runApp(const IshizumiApp());

class IshizumiApp extends StatelessWidget {
  const IshizumiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '石積みマスター',
      theme: ThemeData(primarySwatch: Colors.brown, fontFamily: 'NotoSansJP'),
      home: const HomeScreen(),
    );
  }
}