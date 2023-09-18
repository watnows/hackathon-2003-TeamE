import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pigon/main.dart';
import 'select_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformation {
  String name = '';
  String introduction = '';
  String link = '';
  String linkDescription = '';
}

final _nameController = TextEditingController();
final _introductionController = TextEditingController();
final _linkController = TextEditingController();
final _linkDescriptionController = TextEditingController();

class InputFormScreen extends ConsumerWidget {
  const InputFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: '名前',
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: '自己紹介',
                    border: OutlineInputBorder(),
                  ),
                  controller: _introductionController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'リンク',
                    border: OutlineInputBorder(),
                  ),
                  controller: _linkController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'リンク説明',
                    border: OutlineInputBorder(),
                  ),
                  controller: _linkDescriptionController),
              const Gap(80),
              ElevatedButton(
                onPressed: () {
                  final userInformation = {
                    'name': _nameController.value,
                    'introduction': _introductionController,
                    'link': _linkController,
                    'linkDescription': _linkDescriptionController,
                  };

                  ref
                      .read(userInformationProvider.notifier)
                      .addInformation(userInformation);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectImage()),
                  );
                },
                //
                // NoteModelクラスに、ダミーのデータを引数として渡して保存する.
                // ref.read(noteProvider.notifier).addNote(NotesModel(
                //     id: randomId,
                //     body: bodyController.text,
                //     createdAt: createdAt));

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
      ),
    );
  }
}
