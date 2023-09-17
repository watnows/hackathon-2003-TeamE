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

const imageDescriptions = {
  '0': 'this is image0',
  '1': '',
  '3': 'that is not image3',
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                'Name',
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
                  'self-introduction. lorem ipsum dolor sit amet, consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                      .replaceAll('\\n', '\n'),
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
                imageDescriptions: imageDescriptions,
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
                  'Career, lorem ipsum dolor sit amet, consectetur adipiscing elit. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                      .replaceAll('\\n', '\n'),
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
