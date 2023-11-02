import 'package:flutter/material.dart';
import 'package:project_2/login_register/demoLogin.dart';

import 'loginBtns.dart';
import 'loginText.dart';
import 'text_field.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

              Container(
                child: Image.asset("assets/images/logo1.png"),
                height: 163,
                width: 163,
              ),
              SizedBox(height: 70),

              //...........................................Welcome back
              const Text(
                "We are happy to have you here",
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

              LoginTextField(
                  size: 20,
                  borderRadius: 13,
                  borderColor: Colors.grey.shade400,
                  fillColor: Colors.grey.shade200,
                  padding: 20,
                  labelText: confirmPassword,
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
                child:
                    //----------------------------------------SignIn button
                    LoginBtn(
                  gradientColor1: Colors.black,
                  gradientColor2: Colors.black,
                  gradientColor3: Colors.black,
                  borderRadius: 33,
                  btnHeight: 55,
                  btnWidth: width * 0.68,
                  color: Colors.black,
                  fontSize: 20,
                  text: registerBtn,
                  textColor: Colors.white,
                  onTab: () {},
                ),
              ),

              //----------------------------------------Not a member SignUp
              const SizedBox(
                height: 20,
              ),
              LoginTextButton(
                text: alreadyaMember,
                size: 20,
                color: Color.fromARGB(255, 2, 7, 147),
                onTab: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Demo(),
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
