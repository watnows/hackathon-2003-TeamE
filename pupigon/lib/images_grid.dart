import 'package:flutter/material.dart';

class ImagesGrid extends StatelessWidget {
  const ImagesGrid({super.key, this.images, this.imageDescriptions});
  final Map<String, String>? images;
  final Map<String, String>? imageDescriptions;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
      ),
      itemCount: images!.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Image.network(
                images![index.toString()]!,
                fit: BoxFit.cover,
              ),
            ),
            Text(
                imageDescriptions![index.toString()]?.replaceAll('\\n', '\n') ??
                    ''),
          ],
        );
      },
    );
  }
}
