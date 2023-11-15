import 'package:flutter/material.dart';

import 'loginBtns.dart';
import 'loginText.dart';

import 'text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey1 = GlobalKey<FormState>();

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
  //   if (_globalKey1.currentState!.validate()) {}
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
          Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/appbarbg.jpg",
                    ),
                    fit: BoxFit.fitHeight)
                // borderRadius: BorderRadius.vertical(top: Radius.elliptical(45, 45)),
                // gradient: LinearGradient(
                //   colors: [
                //     Color.fromRGBO(235, 146, 116, 1),
                //     Color.fromRGBO(243, 184, 102, 1),
                //     Color.fromRGBO(228, 223, 162, 1),
                //   ],
                // ),
                ),
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
                            Navigator.pushNamed(context, "/payment");
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
                    child: LoginBtn(
                      borderRadius: 33,
                      btnHeight: 55,
                      btnWidth: width * 0.58,
                      color: Colors.black,
                      fontSize: 20,
                      text: sendotp,
                      textColor: Colors.white,
                      onTab: () {},
                      gradientColor1: Color.fromARGB(255, 111, 78, 55),
                      gradientColor2: Color.fromARGB(255, 111, 78, 55),
                      gradientColor3: Color.fromARGB(255, 111, 78, 55),
                      boxShadow1: const BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0),
                      boxShadow2: const BoxShadow(
                          color: Colors.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0),
                      boxShadow3: const BoxShadow(
                          color: Colors.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
