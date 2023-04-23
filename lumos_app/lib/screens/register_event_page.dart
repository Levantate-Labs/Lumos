import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lumos_app/components/AuthInputs.dart';
import 'package:lumos_app/controller/test_controller.dart';

class RegisterEventPage extends StatelessWidget {
  RegisterEventPage({
    super.key,
  });

  final RegController reg = RegController();

  final String eventImg =
      'http://www.onlylondon.properties/application/modules/themes/views/default/assets/images/image-placeholder.png';

  final String eventName = "HackAthena";
  final String desc = "HackAthena is te first djfhsjdh";
  final String venue = "Jyothi Engineering College";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 4,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: NetworkImage(eventImg),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 390,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    venue,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      desc,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => (FloatingActionButton.extended(
                      heroTag: "btn1",
                      onPressed: () => reg.toggleReg(),
                      label: reg.attend.value == 0
                          ? Text('Register')
                          : Text('Registered'),
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
