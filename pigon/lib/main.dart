import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pigon/firebase_options.dart';
import 'home_page.dart';


final userInformationProvider = StateNotifierProvider.autoDispose<UserInformation,dynamic>((ref) {
  return UserInformation(ref);
}
);


class UserInformation extends StateNotifier<Map> {
  UserInformation(this.ref): super({});
  final Ref ref;
  void addInformation(userdata) {
    state = userdata;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CopyButtonExample(),
    );
  }
}

