import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'select_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';


final inputFormProvider = StateProvider<InputFormData>((ref) {

  return InputFormData();
});

class InputFormData {
  String name = '';
  String introduction = '';
  String link = '';
  String linkDescription = '';
}

class InputFormScreen extends ConsumerWidget {
  const InputFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
            TextField(
              decoration: const InputDecoration(
                labelText: '名前',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read().state.name = value;


              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: '自己紹介',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read().state.introduction = value;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'リンク',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read().state.link = value;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'リンク説明',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read().state.linkDescription = value;
              },
            ),
            const Gap(80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagePickerScreen(

                    name: ref.read(inputFormProvider).name,

                  )),
                );
              
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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

