<<<<<<< HEAD
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lumos_app/screens/welcome.dart';
=======
import 'dart:html';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
>>>>>>> 9864562030d37255a5a1197cd6fa32289ad513a3

class Controller extends GetxController {
  final storage =new  GetStorage();

<<<<<<< HEAD
  Future<String?> login() async {
    // Make the API request
    final response = await http.post(Uri.parse('https://example.com/api/login'));

    if (response.statusCode == 200) {
      // Save the user data to storage
      storage.write('user', response.body);

      // Redirect to the home screen
      Get.to(WelcomePage());
    } else {
      // Return the error message
      return response.body;
    }
  }

  // Map<String, dynamic>? getUser() {
  //   // Retrieve the user data from storage
    // final user = storage.read('user');

  //   // Return null if the user data doesn't exist
  //   if (user == null) {
  //     return null;
  //   }

  //   // Parse the user data as JSON and return it
  //   return jsonDecode(user);
  // }

  void logout() {
    // Delete the user data from storage and redirect to the login screen
    // storage.remove('user');
    Get.offNamed('/login');
=======
  void login(String name, String password) {
    var uri = Uri.parse('http://192.168.43.83:5000/healthcheck');
    print(
      http.post(uri, body: {name, password}),
    );
>>>>>>> 9864562030d37255a5a1197cd6fa32289ad513a3
  }
}
