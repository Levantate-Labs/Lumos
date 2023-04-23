import 'package:flutter/material.dart';
import 'package:lumos_app/controller/controller.dart';
import 'package:lumos_app/controller/nav_controller.dart';

import '../components/feeds_card.dart';
import '../components/highlight_card.dart';
import '../navigation/navbar.dart';

class FeedsPage extends StatefulWidget {
  FeedsPage({super.key, required this.nav}) {
    print(Controller().getEvents());
  }

  final NavController nav;
  late Future<List> users;

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  void initState() {
    super.initState();
    var users = Controller().getEvents();
  }

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
                  " Highlights",
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
                    return HighlightCard(
                      imgSrc: imgSrc,
                      headline: headline,
                      username: username,
                      profileIcon: profileIcon,
                    );
                  },
                ),
              ),

              //Recommended For You Section

              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  " Recommended For You",
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
                    navController: widget.nav,
                    imgSrc: imgSrc,
                    heading: heading,
                    body: body,
                    username: username,
                    profileIcon: profileIcon,
                    like: 0,
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
