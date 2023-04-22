import 'package:flutter/material.dart';

class FeedsCard extends StatelessWidget {
  const FeedsCard({
    super.key,
    required this.heading,
    required this.body,
    this.imgSrc = 'https://example.com/default-image.jpg',
  });

  final String imgSrc;
  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              // color: Colors.red,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(imgSrc),
                    width: 150,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$heading"),
                SizedBox(
                  height: 10,
                ),
                Text("$body"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
