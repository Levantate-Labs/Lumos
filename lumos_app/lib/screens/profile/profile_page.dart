import 'package:flutter/material.dart';
import 'package:lumos_app/controller/controller.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    super.key,
  }) {
    print(Controller().getEvents());
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String profileIcon =
      "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200";

  String username = "Jhon Doe";

  String subtext = "Student | CCE";

  String useremail = "JhonDoe@cce.edu.in";

  String githubUrl = "github.com/JhonDoe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              child: Image(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 130,
                ),
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Color.fromARGB(255, 220, 220, 220),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(profileIcon),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
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
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 350,
                        child: Text(
                          'Personal Details',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email : $useremail",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "GitHub : $githubUrl",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
