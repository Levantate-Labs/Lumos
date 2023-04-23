import 'dart:html';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  // var count = 0.obs;
  // increment() => count++;

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void login(String name, String password) {
    var uri = Uri.parse('http://192.168.43.83:5000/healthcheck');
    print(
      http.post(uri, body: {name, password}),
    );
  }
}
