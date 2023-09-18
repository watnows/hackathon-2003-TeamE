// import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main.dart';
import 'package:gap/gap.dart';

class PreviewPage extends ConsumerWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInformation = ref.read(userInformationProvider);
    print('\n-------prev---------');
    print(userInformation);

    //return Scaffold(
    // body: Column(
    //   children: [
    // Expanded(
    //   child: userInformation.when(
    //     data: (data) {
    //       return ListView.builder(
    //         itemCount: data.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return Text(data[index]);
    //         },
    //       );
    //     },
    //     loading: () => const CircularProgressIndicator(),
    //     error: (err, stack) => Text('Error: $err'),
    //   ),
    // ),

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
            const Gap(550),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreviewPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), // ボタンの形状を楕円形にします
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // 横と縦のパディングを適切に調整します
              ),
              child: const Text(
                '公開',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
