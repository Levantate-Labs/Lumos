import 'package:flutter/material.dart';
import 'package:lumos_app/widgets/feeds_card.dart';
import 'package:lumos_app/widgets/highlight_card.dart';
import 'package:drop_shadow/drop_shadow.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({super.key});

  final String imgSrc =
      "https://images.unsplash.com/photo-1617854818583-09e7f077a156?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  final String headline = "Test Headline";
  final String username = "Akhil Main";
  final String profileIcon =
      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200";
  final String heading = "Heading test";
  final String body =
      "Lorem Ipsum Thenga manga vaazha dksjflkdj hfbfkjdf nbxckjbsdk";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Highlights",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        HighlightCard(
                          imgSrc: imgSrc,
                          headline: headline,
                          username: username,
                          profileIcon: profileIcon,
                        ),
                      ],
                    );
                  },
                ),
              ),

              //Recommended For You Section

              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Recommended For You",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return FeedsCard(
                    imgSrc: imgSrc,
                    heading: heading,
                    body: body,
                    username: username,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
