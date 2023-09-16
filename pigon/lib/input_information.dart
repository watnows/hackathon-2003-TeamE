import 'package:flutter/material.dart';

class InputFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text('サイト情報登録'),
            SizedBox(height: 100),
            TextField(
              decoration: InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'リンク',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'リンク説明',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}