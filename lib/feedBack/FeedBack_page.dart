// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/feedBack/ratingStar.dart';
import 'package:project_2/feedBack/thankYou.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  bool isYesSelected = false;
  bool feedbackGiven = false;
  bool isExpanded = false;
  bool isNoSelected = false;

  void selectYes() {
    setState(() {
      isYesSelected = !isYesSelected;
      if (isYesSelected) {
        isNoSelected = false;
      }
    });
  }

  void selectNo() {
    setState(() {
      isNoSelected = !isNoSelected;
      if (isNoSelected) {
        isYesSelected = false;
      }
    });
  }

  void showFeedBckConfirmation() {
    setState(() {
      feedbackGiven = true;
    });
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: const AssetImage(
                  'assets/images/map view.png',
                ),
                height: 350,
                width: MediaQuery.of(context).size.width - 10,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              Container(
                child: const Text(
                  "Did You Received Your Order?",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: selectYes,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        width: 100,
                        height: 50,
                        color: isYesSelected ? Colors.green : Colors.grey,
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: selectNo,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        width: 100,
                        height: 50,
                        color: isNoSelected ? Colors.red : Colors.grey,
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  collapsedBackgroundColor: Color.fromARGB(255, 134, 89, 22),
                  backgroundColor: Color.fromARGB(255, 224, 169, 30),
                  collapsedTextColor: Colors.white,
                  textColor: Colors.white,
                  title: const Center(child: Text("Share Your FeedBack Here")),
                  initiallyExpanded: isExpanded,
                  children: [
                    Container(
                      height: 180,
                      color: Colors.white,
                      child: Column(
                        children: [
                          const TextField(
                            cursorColor: Colors.orange,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            maxLines: 3,
                            decoration: InputDecoration(
                                hintText: "Write FeedBack Here...."),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          (Color.fromARGB(255, 134, 89, 22)))),
                              onPressed: () {
                                setState(() {
                                  isExpanded = false;
                                });
                              },
                              child: Text("Submit"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "How Would You Rate Our App?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      RatingStar(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  (Color.fromARGB(255, 134, 89, 22)))),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ThankYou();
                              },
                            );
                          },
                          child: Text("Submit")),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
