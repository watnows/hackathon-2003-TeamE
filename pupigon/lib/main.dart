import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pupigon/firebase_options.dart';
import 'package:pupigon/home_page.dart';

const id = 'FwnMRzyyFVHzjKl6hHEz';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const HomePage(id: id),
    );
  }
}
