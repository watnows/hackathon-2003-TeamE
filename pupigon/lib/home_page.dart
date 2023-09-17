import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MediaQuery.of(context).size.width > 480
                ? Container()
                : const Gap(40),
            const Gap(40),
            Text(
              'Name',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Gap(20),
            Text(
              'self-introduction',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Gap(20),
            const Text(
              'img',
            ),
            const Gap(20),
            Text(
              'Career',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
