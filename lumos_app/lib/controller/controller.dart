import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lumos_app/screens/welcome.dart';
import 'package:lumos_app/screens/feeds.dart';

 

class Controller extends GetxController {
  final storage =new  GetStorage();

  Future<String?> login(String pass,String userId) async {
    // Make the API request
    final response = await http.post(Uri.parse('http://192.168.27.247:5000/user/login'),body: {'passwordHash':pass,'ID':userId});
    print(response.body);

    if (response.statusCode == 200) {
      // Save the user data to storage
      storage.write('user', response.body);

      // Redirect to the home screen
      Get.to(FeedsPage());
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
  }
}
