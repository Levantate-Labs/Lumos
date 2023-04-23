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

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              height: 400,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child:Column(
                children: [
                  Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Susmitha",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ]
                      ),
                    ),
                  ),
                  SizedBox(height: 230),
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: () => {}, icon: const Icon(Icons.thumb_up_sharp)),
                            SizedBox(width: 200),
                            OutlinedButton(
                              onPressed: () => {}, 
                              child: Text("Register"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(width: 1.0, color: Colors.blue)
                              )
                            )
                          ]
                        ),
                      ],
                    ),
                  )
                ]
              ),
            ),
          )
        );
  }
}
