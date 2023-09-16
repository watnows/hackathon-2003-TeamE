import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_information.dart';
import 'package:gap/gap.dart';

class CopyButtonExample extends StatelessWidget {
  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: "URL1")); // "URL"テキストをクリップボードにコピー
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('コピー完了'),
      ),
    );
  }

  void _createButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0), // 上部の余白を追加
        child: Column(
          children: [
            const Gap(150),
            ElevatedButton(
              onPressed: () => _createButtonPressed(context),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(), // ボタンの形状を楕円形にします
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 横と縦のパディングを適切に調整します
                ),
              child: const Text(
                '作る',
                style: TextStyle(
                  fontSize: 30, 
                  ),
              ),

            ),

            const Gap(90),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'URL1',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _copyToClipboard(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(), // ボタンの形を円に設定
                    minimumSize: const Size(48, 48), // ボタンの最小サイズを設定（必要に応じて調整）
                    ),
                child: const Icon(Icons.content_copy, color: Colors.white), // テキストの代わりにコピーのアイコンを使用し、色を白に設定
                ),
              ]
            ),           
          ],
        ),
      ),
    );
  }
}
