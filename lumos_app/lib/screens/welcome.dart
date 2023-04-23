// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumos_app/components/AuthButtons.dart';
import 'package:lumos_app/components/AuthInputs.dart';
import 'package:lumos_app/components/AuthTiles.dart';
import 'package:lumos_app/screens/auth/signup.dart';

import '../components/navbar.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double _sigmaX = 5; 
  double _sigmaY = 5; 
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'https://images.pexels.com/photos/64609/pexels-photo-64609.jpeg?auto=compress&cs=tinysrgb&w=1600',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/images/levantate_sadha.png'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.018),
                  const Text("Hi !",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 1)
                                  .withOpacity(_opacity),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 30),
                                  // username textfield
                                  MyTextField(
                                    controller: usernameController,
                                    hintText: 'Email',
                                    obscureText: false,
                                  ),

                                  const SizedBox(height: 10),

                                  MyTextField(
                                    controller: passwordController,
                                    hintText: 'Password',
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 10),

                                  // sign in button
                                  MyButton(
                                    onTap: (() {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signup()),
                                        );
                                      } else {
                                        print('not valid');
                                      }
                                    }),
                                  ),

                                  const SizedBox(height: 10),

                                  const SizedBox(height: 10),

                                  // not a member? register now
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Text(
                                              'Don\'t have an account?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(width: 4),
                                            TextButton(
                                                onPressed: () {
                                                  Get.to(Signup());
                                                },
                                                child: Text('Sign Up',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 71, 233, 133),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                    textAlign:
                                                        TextAlign.start)),
                                          ],
                                        ),
                                        const Text('Forgot Password?',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                            textAlign: TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
