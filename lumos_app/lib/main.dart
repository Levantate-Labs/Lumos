import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumos_app/navigation/navbar.dart';
import 'package:lumos_app/screens/profile/profile_page.dart';
import 'package:lumos_app/screens/Onboarding/Onboarding1.dart';

import 'package:lumos_app/screens/auth/signup.dart';
import 'package:lumos_app/screens/feeds.dart';
import 'package:lumos_app/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lumos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 220, 220, 220),
        brightness: Brightness.light,
      ),
      home: WelcomePage(),
    );
  }
}
