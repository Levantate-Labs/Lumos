import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lumos_app/components/AuthInputs.dart';
import 'package:lumos_app/controller/controller.dart';
import 'package:lumos_app/controller/nav_controller.dart';
import 'package:lumos_app/controller/test_controller.dart';
import 'package:lumos_app/models/posts.dart';

class RegisterEventPage extends StatefulWidget {
  RegisterEventPage({super.key, required this.nav});

  final NavController nav;

  @override
  State<RegisterEventPage> createState() => _RegisterEventPageState();
}

class _RegisterEventPageState extends State<RegisterEventPage> {
  late List<Events> _events = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  bool _isLoading = true;

  void _getData() async {
    _events = await Controller().getEvents();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        _isLoading = false; // update loading state when data is loaded
      });
    });
  }

  final RegController reg = RegController();

  final String eventImg =
      'http://www.onlylondon.properties/application/modules/themes/views/default/assets/images/image-placeholder.png';

  final String eventName = "HackAthena";

  final String desc = "HackAthena is te first djfhsjdh";

  final String venue = "Jyothi Engineering College";

  Controller c = Controller();

  var nav = NavController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading // show CircularProgressIndicator if loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: NetworkImage(
                              _events[nav.getCardIndex()].imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 390,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _events[nav.getCardIndex()].name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          _events[nav.getCardIndex()].location,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            _events[nav.getCardIndex()].content,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => (FloatingActionButton.extended(
                            heroTag: "btn1",
                            onPressed: () => {
                              reg.toggleReg(),
                            },
                            label: reg.attend.value == 0
                                ? Text('Register')
                                : Text('Registered'),
                          )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
