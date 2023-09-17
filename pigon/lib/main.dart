import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_page.dart';



final userInformationProvider = StateNotifierProvider<UserInformation,dynamic>((ref){
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



void main() {
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

