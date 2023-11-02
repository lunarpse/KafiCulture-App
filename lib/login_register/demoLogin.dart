import 'package:flutter/material.dart';
import 'package:project_2/login/constants.dart';
import 'package:project_2/login_register/forgetPwd.dart';

import 'loginBtns.dart';
import 'loginText.dart';
import 'register.dart';
import 'text_field.dart';

class Demo extends StatefulWidget {
  Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              // const SizedBox(height: 40),
              //-------------------------------------------Icon
              // const Icon(
              //   Icons.lock,
              //   size: 150,
              // ),
              Container(
                child: Image.asset("assets/images/logo1.png"),
                height: 163,
                width: 163,
              ),
              SizedBox(height: 70),

              //...........................................Welcome back
              const Text(
                "Welcome back,We missed you",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              //-----------------------------------------userName textfield
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

              //----------------------------------------userPassword textfield
              LoginTextField(
                  size: 20,
                  borderRadius: 13,
                  borderColor: Colors.grey.shade400,
                  fillColor: Colors.grey.shade200,
                  padding: 20,
                  labelText: userPassword,
                  controller: passwordController,
                  hideText: true,
                  onSaved: (value) {
                    _password = value!;
                  },
                  validator: _validatePassword),
              //----------------------------------------forgetPassword button
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
                      color: Colors.black,
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
                      gradientColor1: Colors.black,
                      gradientColor2: Colors.black,
                      gradientColor3: Colors.black,
                      borderRadius: 33,
                      btnHeight: 55,
                      btnWidth: width * 0.38,
                      color: Colors.black,
                      fontSize: 20,
                      text: signInBtn,
                      textColor: Colors.white,
                      onTab: () {},
                    ),
                  ],
                ),
              ),

              //----------------------------------------Not a member SignUp
              const SizedBox(
                height: 20,
              ),
              LoginTextButton(
                text: registerNow,
                size: 20,
                color: Color.fromARGB(255, 2, 7, 147),
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
