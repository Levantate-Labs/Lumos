import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lumos_app/controller/nav_controller.dart';
import 'package:lumos_app/navigation/navbar.dart';
import 'package:lumos_app/screens/welcome.dart';
import 'package:lumos_app/screens/feeds.dart';

import '../models/posts.dart';

class Controller extends GetxController {
  final NavController nav = NavController();

  final storage = GetStorage();
  final String baseUrl = "https://lumos-production.up.railway.app";

  var eventID = 0.obs;
  final tFEventName = ''.obs;
  final tFVenue = ''.obs;
  final selectedDate = DateTime.now().obs;
  final dateController = TextEditingController();
  final tFImgSrc = ''.obs;
  final content = ''.obs;

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

  @override
  void onClose() {
    // dispose the controller when the widget is removed from the widget tree
    dateController.dispose();
    super.onClose();
  }

  void logout() {
    // Delete the user data from storage and redirect to the login screen
    // storage.remove('user');
    Get.offNamed('/login');
  }

  Future<List<Events>> getEvents() async {
    final response = await http.get(
      Uri.parse('$baseUrl/post/events'),
    );

    if (response.statusCode == 200) {
      List<Events> events = eventsFromJson(response.body);
      return events;
    }
    return [];
  }

  void registerEvent() async {
    var user = jsonDecode(storage.read('user'));
    print(user["ID"].toString());
    final response = await http.post(Uri.parse('$baseUrl/post/create'), body: {
      "ID": eventID.value.toString(),
      "content": content.value,
      "postType": "EVENT",
      "name": tFEventName.value,
      "location": tFVenue.value,
      "tags": '["Hackathon", "Web3", "Open Innovation", "NoToDrugs"]',
      "createdById": user["ID"].toString(),
      "imageUrl": tFImgSrc.value,

      // "ID": eventID.value.toString(),
      // "tags": [],
      // "content": content.value,
      // "postType": "EVENT",
      // "createdById": user["ID"].toString(),
      // "imageUrl": tFImgSrc.value,
      // "name": tFEventName.value,
      // "location": tFVenue.value,
    });
    if (response.statusCode == 200) {
      nav.changeTabIndex(0);
      eventID.value = eventID.value + 1;
    } else {
      print(user["ID"].toString());
      print(response.body);
    }
  }
}
