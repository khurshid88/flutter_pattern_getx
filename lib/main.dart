import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/pages/home_page.dart';
import 'package:pattern_getx/pages/main_page.dart';
import 'package:pattern_getx/services/bind_service.dart';

import 'services/di_service.dart';

void main() async {
  //await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      initialBinding: BindService(),
      getPages: [
        GetPage(
          name: MainPage.id,
          page: () => const MainPage(),
          binding: BindService(),
        ),
      ],
    );
  }
}
