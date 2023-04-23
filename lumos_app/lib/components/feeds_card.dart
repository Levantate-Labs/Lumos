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
