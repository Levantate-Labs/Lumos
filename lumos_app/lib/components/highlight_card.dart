import 'package:flutter/material.dart';
import 'package:drop_shadow/drop_shadow.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({
    super.key,
    required this.username,
    required this.headline,
    required this.profileIcon,
    required this.imgSrc,
  });
  final String imgSrc;
  final String headline;
  final String profileIcon;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: [
          Card(
            elevation: 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(imgSrc),
                fit: BoxFit.fill,
                width: 390,
                height: 250,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 250,
            width: 400,
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: NetworkImage(profileIcon),
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      username,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  headline,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
