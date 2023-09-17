import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputFormScreen extends StatefulWidget {
  const InputFormScreen({Key? key}) : super(key: key);

  @override
  InputFormScreenState createState() => InputFormScreenState();
}

class InputFormScreenState extends State<InputFormScreen> {
  List<Map<String, String>> linkFormList = [
    {
      "url": "https...",
      "description": "desc of ..."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              // リンクとリンク説明のセットを動的に生成
              // ignore: unused_local_variable
              for (final linkForm in linkFormList)
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'リンク',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'リンク説明',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  // リンクとリンク説明のセットを追加
                  setState(() {
                    linkFormList.add({
                      "url": "https...",
                      "description": "desc of ..."
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0), // マルの大きさを調整
                ),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 24.0), // +のフォントサイズを調整
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
