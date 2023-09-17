import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gap/gap.dart';
import 'dart:io';

//before
class SelectImage extends StatelessWidget {
  final ValueNotifier<List<XFile>?> _imageNotifier =
      ValueNotifier<List<XFile>?>(null);

  SelectImage({Key? key}) : super(key: key);

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
                const SizedBox(width: 60),
                const Text(
                  'name',
                  style: TextStyle(
                    fontSize: 15,
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Images',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
