import 'package:flutter/material.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard({
    super.key,
    required this.username,
    required this.heading,
    required this.body,
    required this.profileIcon,
    required this.imgSrc,
  });

  final String imgSrc;
  final String heading;
  final String body;
  final String profileIcon;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            offset: Offset(
              3.0,
              3.0,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: NetworkImage(profileIcon),
                  height: 25,
                  width: 25,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                username,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ],
          ),
          Image(
            image: NetworkImage(imgSrc),
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
    );
  }
}
