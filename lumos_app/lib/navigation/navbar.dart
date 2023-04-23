import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumos_app/controller/nav_controller.dart';
import 'package:lumos_app/screens/feeds.dart';
import 'package:lumos_app/screens/profile/profile.dart';

class NavigationPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, navController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: navController.changeTabIndex,
            currentIndex: navController.tabIndex.value,
            backgroundColor: Colors.green,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20.0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20.0,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20.0,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20.0,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 20.0,
                ),
                label: 'Search',
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final NavController navController =
        Get.put(NavController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, navController),
      body: Obx(() => IndexedStack(
            index: navController.tabIndex.value,
            children: const [
              FeedsPage(),
              ProfilePage(),
            ],
          )),
    ));
  }
}
