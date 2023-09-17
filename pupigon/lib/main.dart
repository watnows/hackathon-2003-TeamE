import 'package:flutter/material.dart';
import 'package:pupigon/home_page.dart';

void main() {
  runApp(const Pupigon());
}

class Pupigon extends StatelessWidget {
  const Pupigon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pupigon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
