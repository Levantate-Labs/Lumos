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
          backgroundColor: Colors.blueAccent,
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
          backgroundColor: Colors.blueAccent,
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
          backgroundColor: Colors.blueAccent,
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
          backgroundColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
