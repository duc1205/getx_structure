import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'routers/app_pages.dart';

void main() {
  TalkerFlutter.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
    );
  }
}
