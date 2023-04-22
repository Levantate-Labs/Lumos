import 'package:flutter/material.dart';
import 'package:drop_shadow/drop_shadow.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard({
    super.key,
    required this.username,
    required this.heading,
    required this.body,
    this.profileIcon = const Icon(Icons.account_circle),
    required this.imgSrc,
  });

  final String imgSrc;
  final String heading;
  final String body;
  final Icon profileIcon;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(imgSrc),
                width: 150,
                height: 100,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  profileIcon,
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                ],
              ),
              Text(
                heading,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Container(
                width: 200,
                child: Text(
                  body,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
