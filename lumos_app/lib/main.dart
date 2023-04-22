import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

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
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  Other({super.key});

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${c.count}"),
        ],
      ),
    );
  }
}
