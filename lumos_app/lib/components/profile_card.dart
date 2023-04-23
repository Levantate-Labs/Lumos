import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
  });

  String profileIcon =
      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200";

  String username = "Akhil Vaazha";
  String subtext = "CEO, India";
  String useremail = "akhilmass@monster.com";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.93,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(profileIcon),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          subtext,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.82,
                child: Text(
                  "Email : $useremail",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
