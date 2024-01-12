// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/appbar/appbar_widget.dart';
import 'package:project_2/constants/color_constants.dart';
import 'package:project_2/constants/text_constants.dart';
import 'package:project_2/feedBack/bloc/feedback_bloc.dart';
import 'package:project_2/feedBack/orderrecieved.dart';
import 'package:project_2/feedBack/ratingStar.dart';
import 'package:project_2/feedBack/thankYou.dart';
import 'package:project_2/customdrawer/drawerScreen.dart';
import 'package:project_2/feedBack/yesrecieved.dart';
import 'package:project_2/homepage/reusable_widgets/background_container_widget.dart';

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
    final FeedbackBloc feedbackBloc = FeedbackBloc();
    return BlocConsumer<FeedbackBloc, FeedbackState>(
      bloc: feedbackBloc,
      listenWhen: (previous, current) => current is FeedbackActionState,
      buildWhen: (previous, current) => current is! FeedbackActionState,
      listener: (context, state) {
        if (state is FeedbackYesButtonClickedState) {
          setState(() {
            isYesSelected = !isYesSelected;
            if (isYesSelected) {
              isNoSelected = false;
            }
          });
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return yesreceived();
            },
          );
        } else if (state is FeedbackNoButtonClickedState) {
          setState(() {
            isNoSelected = !isNoSelected;
            if (isNoSelected) {
              isYesSelected = false;
            }
          });
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return orderrecieved();
            },
          );
        } else if (state is FeedbackSubmitButtonClickedState) {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ThankYou();
            },
          ).whenComplete(
              () => Navigator.pushReplacementNamed(context, "/home"));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppbarWidget(
            incart: false,
          ),
          drawer: DrawerScreen(),
          body: BackgroundContainerWidget(
            opacity: 0.5,
            x: 7.0,
            y: 7.0,
            child: SingleChildScrollView(
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
                        orderconfirmation,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            feedbackBloc.add(FeedbackYesButtonClickedEvent());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              width: 100,
                              height: 50,
                              color: isYesSelected ? selectedyes : notselected,
                              child: Center(
                                child: Text(
                                  yes,
                                  style: TextStyle(color: feedbacktextcolor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            feedbackBloc.add(FeedbackNoButtonClickedEvent());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Container(
                              width: 100,
                              height: 50,
                              color: isNoSelected
                                  ? feedbackselectedno
                                  : notselected,
                              child: Center(
                                child: Text(
                                  no,
                                  style: TextStyle(color: feedbacktextcolor),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        collapsedBackgroundColor: feedbackcollapsebgcolor,
                        backgroundColor: feedbackcollapsebackgroundcolor,
                        collapsedTextColor: feedbackcollapsetextcolor,
                        textColor: feedbackcollapsetextcolor,
                        title: Center(child: Text(feedbackbox)),
                        initiallyExpanded: isExpanded,
                        children: [
                          Container(
                            height: 180,
                            color: feedbackcollapsetextcolor,
                            child: Column(
                              children: [
                                TextField(
                                  cursorColor: feedbackcursorrcolor,
                                  style: TextStyle(
                                    color: feedbackblack,
                                    fontSize: 20,
                                  ),
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      hintText: feedbackmessage),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                (feedbackcollapsebgcolor))),
                                    onPressed: () {
                                      setState(() {
                                        isExpanded = false;
                                      });
                                    },
                                    child: Text(submit,style:TextStyle(color: textcolour),))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width - 20,
                      decoration: BoxDecoration(
                        color: textcolour,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              rating,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            RatingStar(),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            (feedbackcollapsebgcolor))),
                                onPressed: () {
                                  feedbackBloc
                                      .add(FeedbackSubmitButtonClickedEvent());
                                },
                                child: Text(submit,style:TextStyle(color: textcolour),)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
