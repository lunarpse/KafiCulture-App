import 'package:flutter/material.dart';
import 'package:project_2/login/constants.dart';
import 'package:project_2/login_register/forgetPwd.dart';
import 'package:project_2/payments/payment_app.dart';

import '../remove/done.dart';
import 'loginBtns.dart';
import 'loginText.dart';
import 'register.dart';
import 'text_field.dart';

class GenieBottomSheet extends StatefulWidget {
  const GenieBottomSheet({super.key});

  @override
  State<GenieBottomSheet> createState() => _GenieBottomSheetState();
}

class _GenieBottomSheetState extends State<GenieBottomSheet> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  late String _email, _password;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // void _submitForm() {
  //   if (_globalKey.currentState!.validate()) {}
  // }

  String? _validateEmail(_email) {
    if (_email!.isEmpty) {
      return "please enter email id";
    } else {
      return "hi";
    }
  }

  String? _validatePassword(_password) {
    if (_password!.isEmpty) {
      return "please enter password";
    } else if (_password.toString().length < 6) {
      return "minimum length 6";
    } else {
      return "hii";
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:
          // backgroundColor: Color.fromRGBO(66, 24, 6, 1),
          Container(
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.vertical(top: Radius.elliptical(45, 45)),
            gradient: LinearGradient(colors: [
          Color.fromRGBO(66, 24, 6, 1),
          Color.fromRGBO(243, 172, 73, 1),
          Color.fromRGBO(228, 223, 162, 1),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    loginTitle,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  LoginTextButton(
                      text: skipButtonText,
                      size: 25,
                      color: Colors.white,
                      onTab: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentApp(),
                            ));
                      })
                ],
              ),
              LoginTextField(
                  size: 20,
                  borderRadius: 13,
                  borderColor: Colors.grey.shade400,
                  fillColor: Colors.grey.shade200,
                  padding: 20,
                  labelText: userName,
                  controller: userNameController,
                  hideText: false,
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (_email) {
                    if (_email!.isEmpty) {
                      return "please enter email id";
                    } else {
                      return "hi";
                    }
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 31,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginTextButton(
                      text: forgetText,
                      size: 15,
                      color: Colors.white,
                      onTab: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ));
                      },
                    ),

                    //----------------------------------------SignIn button
                    LoginBtn(
                      borderRadius: 33,
                      btnHeight: 55,
                      btnWidth: width * 0.38,
                      color: Colors.black,
                      fontSize: 20,
                      text: signInBtn,
                      textColor: Colors.white,
                      onTab: () {},
                      gradientColor1: Color.fromARGB(255, 179, 88, 48),
                      gradientColor2: Color.fromARGB(255, 183, 98, 70),
                      gradientColor3: Color.fromARGB(255, 185, 132, 88),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white, // Image radius
                      backgroundImage:
                          AssetImage('assets/images/googleLogo.png'),
                    ),
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white, // Image radius
                      backgroundImage:
                          AssetImage('assets/images/facebookLogo.png'),
                    ),
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white, // Image radius
                      backgroundImage:
                          AssetImage('assets/images/appleLogo.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LoginTextButton(
                text: registerNow,
                size: 20,
                color: Colors.white,
                onTab: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
