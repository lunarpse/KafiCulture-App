import 'package:flutter/material.dart';
// import 'package:genie_merger/payments/payment_app.dart';

import '../payments/payment_app.dart';
import 'colors.dart';
import 'constants.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo1.png",
                        height: height * 0.45,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: height * 0.49,
                        width: width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                stops: [0.5, 0.9],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white])),
                      ),
                      // const Positioned(
                      //   bottom: 0,
                      //   left: 0,
                      //   right: 0,
                      //   child: Center(
                      //     child: Column(
                      //       children: [
                      //         Text(
                      //           appName,
                      //           style: TextStyle(
                      //               fontSize: 25, fontWeight: FontWeight.w700),
                      //         ),
                      //         //       Text(slogan,
                      //         // style: TextStyle(color: Colors.grey),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Container(
                      child: const Text(
                        "$loginString",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor.withOpacity(0.3),
                              primaryColor.withOpacity(0.1)
                            ],
                          ),
                          border: const Border(
                              left: BorderSide(color: primaryColor, width: 5))),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: TextFormField(
                        controller: emailController,
                        onSaved: (value) {
                          _email = value!;
                        },
                        validator: (_email) {
                          if (_email!.isEmpty) {
                            return "please enter email id";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            prefixIcon: Icon(Icons.email, color: primaryColor),
                            labelText: "EMAIL ADDRESS",
                            labelStyle:
                                TextStyle(color: primaryColor, fontSize: 16)),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                        onSaved: (value) {
                          _password = value!;
                        },
                        validator: (_password) {
                          if (_password!.isEmpty) {
                            return "Please Enter valid password";
                          } else if (_password.length < 8 ||
                              _password.length > 15) {
                            return "pass length is low";
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            prefixIcon:
                                Icon(Icons.lock_open, color: primaryColor),
                            labelText: "PASSWORD",
                            labelStyle:
                                TextStyle(color: primaryColor, fontSize: 16)),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: const Text(forgetText)),
                  ),
                  Center(
                      child: SizedBox(
                          height: height * 0.08,
                          width: width - 30,
                          child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            // color:primaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();

                                if (_email == "abc@gmail.com" &&
                                    _password == "12345678") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentApp(),
                                    ),
                                  );
                                  FocusScope.of(context).unfocus();
                                } else {
                                  print("invalid details");
                                }
                              }
                            },
                            child: const Text(
                              "Login To Account ",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white),
                            ),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't Have An Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create Account",
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
