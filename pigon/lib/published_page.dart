import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'preview_page.dart';

class PublishedPage extends StatelessWidget {
  const PublishedPage({Key? key, required this.url}) : super(key: key);
  final String url;


  void _copyToClipboard(BuildContext context) {
    final data = ClipboardData(text: 'https://watnow-hackathon-pigon.web.app/?id='+url);
    Clipboard.setData(data);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('コピー完了'),
      ),
    );
  }

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
                const SizedBox(width: 40),
                const Text(
                  'URLが生成されました',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            
            const Gap(200),
            
            Row(
              children: [
                Expanded(
                  child: Text(
                  'https://watnow-hackathon-pigon.web.app/?id='+url,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _copyToClipboard(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(), 
                    minimumSize: const Size(48, 48),
                  ),
                  child: const Icon(Icons.content_copy, color: Colors.white),
                ),
              ],
            ),
            const Gap(300),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreviewPage()),
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
