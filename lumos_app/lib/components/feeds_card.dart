import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lumos_app/controller/controller.dart';
import 'package:lumos_app/controller/nav_controller.dart';
import 'package:lumos_app/controller/test_controller.dart';

class FeedsCard extends StatelessWidget {
  FeedsCard({
    super.key,
    required this.username,
    required this.heading,
    required this.body,
    required this.profileIcon,
    required this.imgSrc,
    required this.like,
    required this.navController,
  });

  final String imgSrc;
  final String heading;
  final String body;
  final String profileIcon;
  final String username;
  final int like;

  final NavController navController;

  final LikeController c = LikeController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Container(
            width: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(profileIcon)),
                      const SizedBox(width: 10),
                      Text(
                        username,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ]),
                  ),
                ),
                Container(
                  width: 400,
                  color: Colors.white10,
                  child: Image(
                    image: NetworkImage(imgSrc),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => IconButton(
                              onPressed: () => {c.toggleLike()},
                              icon: c.like.value == 1
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 200),
                          OutlinedButton(
                            onPressed: () => navController.changeTabIndex(7),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1.0, color: Colors.blue),
                            ),
                            child: const Text("Register"),
                          ),
                        ],
                      ),
                      Container(
                        width: 360,
                        child: Text(
                          heading,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
