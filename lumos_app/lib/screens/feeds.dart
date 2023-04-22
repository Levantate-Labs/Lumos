import 'package:flutter/material.dart';
import 'package:lumos_app/widgets/feeds_card.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: const [
              SizedBox(
                height: 20,
              ),
              FeedsCard(
                imgSrc:
                    "https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                heading: "Heading",
                body: "body",
              ),
            ],
          );
        },
      ),
    );
  }
}
