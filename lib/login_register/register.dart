import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:project_2/payments/payment_app.dart';

import 'loginBtns.dart';
import 'loginText.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _globalKey2 = GlobalKey<FormState>();

  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  late String _email, _password;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/appbarbg.jpg",
                  ),
                  fit: BoxFit.cover)),
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
                          Navigator.pushNamed(context, '/payment');
                        })
                  ],
                ),
                SizedBox(
                  height: 46,
                ),
                const Pinput(
                  length: 6,
                ),
                SizedBox(
                  height: 30,
                ),
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
                    text: verifyotp,
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
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
