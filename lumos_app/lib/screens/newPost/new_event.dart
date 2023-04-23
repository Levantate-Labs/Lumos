import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumos_app/controller/controller.dart';

class NewEvent extends StatelessWidget {
  NewEvent({super.key}) {}
  Controller controller = new Controller();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // RadioListTile(
            //   title: const Text('Online'),
            //   value: 'Online',
            //   groupValue: controller.userData.value,
            //   onChanged: (value) => {
            //     controller.userData.value = value.toString(),
            //   },
            // ),
            // RadioListTile(
            //   title: const Text('Online'),
            //   value: 'Online',
            //   groupValue: controller.userData.value,
            //   onChanged: (value) => {
            //     controller.userData.value = value.toString(),
            //   },
            // ),
          ],
        )
      ],
    );
  }
}
