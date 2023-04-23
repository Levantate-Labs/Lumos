import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      Text("Feeds"),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      Text("Feeds"),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      Text("Feeds"),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      Text("Feeds"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
