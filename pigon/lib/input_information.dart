import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'select_image.dart';

class InputFormScreen extends StatelessWidget {
  const InputFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Gap(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 80),
                const Text('サイト情報登録'),
              ],
            ),
            const SizedBox(height: 100),
            const TextField(
              decoration: InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'リンク',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'リンク説明',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagePickerScreen()),
                  );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), // ボタンの形状を楕円形にします
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 横と縦のパディングを適切に調整します
                ),
              child: const Text(
                '完了',
                style: TextStyle(
                  fontSize: 30, 
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
