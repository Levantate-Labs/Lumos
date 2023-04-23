import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lumos_app/dto/EventsDTO.dart';
import 'package:lumos_app/navigation/navbar.dart';
import 'package:lumos_app/screens/welcome.dart';
import 'package:lumos_app/screens/feeds.dart';

class Controller extends GetxController {
  final storage = new GetStorage();
  late var events = [].obs as List<Event>;
  final String baseUrl = "https://lumos-production.up.railway.app";

  Future<String?> login(String pass, String userId) async {
    final response = await http.post(Uri.parse('$baseUrl/user/login'),
        body: {'passwordHash': pass, 'ID': userId});

    if (response.statusCode == 200) {
      storage.write('user', response.body);
      Get.to(() => NavigationPage());
    } else {
      print(response.body.toString());
      return response.body;
    }
  }

  Map<String, dynamic>? getUser() {
    final user = storage.read('user');

    // Return null if the user data doesn't exist
    if (user == null) {
      return null;
    } else {
      Get.to(() => NavigationPage());
    }
    // Parse the user data as JSON and return it
    return jsonDecode(user);
  }

  void logout() {
    // Delete the user data from storage and redirect to the login screen
    // storage.remove('user');
    Get.offNamed('/login');
  }

  Future<List<Event>?> getEvents() async {
    final response = await http.get(
      Uri.parse('$baseUrl/post/events'),
    );

    if (response.statusCode == 200) {
      List<Event> events = eventsFromJson(response.body).events;
      return events;
    } else {
      print(response.body);
    }
  }
}
