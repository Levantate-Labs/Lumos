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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black38),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(imgSrc),
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      body,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
