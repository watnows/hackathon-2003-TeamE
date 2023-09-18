import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gap/gap.dart';
import 'dart:io';
import 'preview_page.dart';

class ImagePickerScreen extends StatelessWidget {
  final ValueNotifier<List<XFile>?> _imageNotifier = ValueNotifier<List<XFile>?>(null);

  ImagePickerScreen({Key? key}) : super(key: key);

  Future<void> getImage() async {
    
    final imagePicker = ImagePicker();
    final images = await imagePicker.pickMultiImage();

    _imageNotifier.value = [...?_imageNotifier.value, ...images];
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
                const SizedBox(width: 80),
                const Text(
                  '画像を選択',
                  style: TextStyle(
                  fontSize: 20, 
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: ValueListenableBuilder<List<XFile>?>(
                  valueListenable: _imageNotifier,
                  builder: (context, images, child) {
                    if (images == null || images.isEmpty) {
                      return const Text('No images selected.');
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          final image = images[index];
                          return Image.file(File(image.path));
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PreviewPage()),
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
            const Gap(85),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: '写真を選んでください',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
