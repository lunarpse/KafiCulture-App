import 'package:flutter/material.dart';
import 'package:project_2/Cargo/feedback_page/stepper.dart';
import 'package:project_2/appbar/appbar_widget.dart';
//import 'package:project_2/feedBack/stepper.dart';

class FeedbackPageCargo extends StatefulWidget {
  const FeedbackPageCargo({super.key});

  @override
  State<FeedbackPageCargo> createState() => _FeedbackPageCargoState();
}

class _FeedbackPageCargoState extends State<FeedbackPageCargo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(incart: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Statusindicator(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Hi John ,",
                      style: TextStyle(fontSize: 33),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown,
                            blurRadius: 7.0,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 235, 211, 197)),
                    child: Column(
                      children: [
                        Text(
                          "Your Order Has Been Placed Successfully",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 23),
                        ),
                        Image.asset(
                          "assets/images/complete.png",
                          height: 45,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "Your order id is :123u09u",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("Delievery by 14/01/24  1:00pm",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(10),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown)),
                        onPressed: () {},
                        child: Text("Manage Order",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text("Delivery Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                            "34 -B . Church Street Main Road ,Opp. Church , Bangalore 110085 ,Karnataka ,India",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 7, right: 7),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/payment');
                },
                child: Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ));
  }
}
