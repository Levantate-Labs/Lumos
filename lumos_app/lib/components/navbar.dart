import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(
              Icons.home,
              size: 20.0,
            ),
          ),
          label: 'Home',
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(
              Icons.search,
              size: 20.0,
            ),
          ),
          label: 'Explore',
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(
              Icons.location_history,
              size: 20.0,
            ),
          ),
          label: 'Places',
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Icon(
              Icons.settings,
              size: 20.0,
            ),
          ),
          label: 'Settings',
          backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        ),
      ],
    );
  }
}
