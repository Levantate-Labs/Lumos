import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumos_app/components/buttons.dart';
import 'package:lumos_app/controller/nav_controller.dart';

class NewPostPage extends StatelessWidget {
  NewPostPage({super.key});

  final NavController navController =
      Get.put(NavController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => navController.changeTabIndex(5),
            child: Text('Create a Post'),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () => navController.changeTabIndex(6),
            child: Text('Create an Event'),
          ),
        ],
      ),
    );
  }
}
