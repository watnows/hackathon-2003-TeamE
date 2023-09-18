import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:gap/gap.dart';
import 'published_page.dart';


class PreviewPage extends ConsumerWidget {
  const PreviewPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.read(userInformationProvider);
    var db = FirebaseFirestore.instance;

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
            const SizedBox(width: 70),
            const Text(
              'プレビュー',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('名前: ${userInformation['name'] ?? '未設定'}', style: const TextStyle(fontSize: 20)),
                Text('自己紹介: ${userInformation['selfIntroduction'] ?? '未設定'}', style: const TextStyle(fontSize: 20)),
                Text('リンク: ${userInformation['career'] ?? '未設定'}', style: const TextStyle(fontSize: 20)),
                Text('リンク説明: ${userInformation['linkDescription'] ?? '未設定'}', style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            var url;
          db.collection("homepages").add(userInformation).then((DocumentReference doc) {
            url = doc.id;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  PublishedPage(url: url)),
            );
          });
          
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), 
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: const Text(
            '公開',
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
