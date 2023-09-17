import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pupigon/images_grid.dart';

const images = {
  '0': 'https://picsum.photos/200/200',
  '1': 'https://picsum.photos/200/150',
  '2': 'https://picsum.photos/200/300',
  '3': 'https://picsum.photos/201/300',
  '4': 'https://picsum.photos/200/210',
  '5': 'https://picsum.photos/200/220',
  '6': 'https://picsum.photos/200/230',
  '7': 'https://picsum.photos/200/240',
};

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;

    return FutureBuilder(
      future: db.collection('homepages').doc(id).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _HomePage(
            images: images,
            params: snapshot.data!.data(),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({this.images, this.params});
  final Map<String, String>? images;
  final Map<String, dynamic>? params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            MediaQuery.of(context).size.width > 480
                ? Container()
                : const Gap(40),
            const Gap(40),
            Center(
              child: Text(
                params!['name'] ?? '',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Gap(40),
            Center(
              child: Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.1,
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  params!['selfIntroduction']?.replaceAll('\\n', '\n') ??
                      ''.replaceAll('\\n', '\n'),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const Gap(40),
            Container(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.2,
                left: MediaQuery.of(context).size.width * 0.2,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: ImagesGrid(
                images: images,
                imageDescriptions: params!['imageDescriptions'] ?? {},
              ),
            ),
            const Gap(20),
            Center(
              child: Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.1,
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Text(
                  params!['description']?.replaceAll('\\n', '\n') ?? '',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
