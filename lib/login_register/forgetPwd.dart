// import 'package:flutter/material.dart';

// import 'loginBtns.dart';
// import 'loginText.dart';

// import 'text_field.dart';

// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({super.key});

//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

//   final userNameController = TextEditingController();

//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     userNameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),

//               SizedBox(
//                 height: 163,
//                 width: 163,
//                 child: Image.asset("assets/images/logo1.png"),
//               ),
//               const SizedBox(height: 70),

//               //...........................................Welcome back
//               const Text(
//                 "Welcome back,We missed you",
//                 style: TextStyle(fontSize: 20),
//               ),
//               const SizedBox(height: 20),
//               //-----------------------------------------OTP textfield
//               LoginTextField(
//                 size: 20,
//                 borderRadius: 13,
//                 borderColor: Colors.grey.shade400,
//                 fillColor: Colors.grey.shade200,
//                 padding: 20,
//                 labelText: otp,
//                 controller: userNameController,
//                 hideText: false,
//                 validator: (_email) {
//                   if (_email!.isEmpty) {
//                     return "please enter email id";
//                   } else {
//                     return "hi";
//                   }
//                 },
//                 onSaved: (String) {},
//               ),

//               //----------------------------------------userPassword textfield
//               LoginTextField(
//                 size: 20,
//                 borderRadius: 13,
//                 borderColor: Colors.grey.shade400,
//                 fillColor: Colors.grey.shade200,
//                 padding: 20,
//                 labelText: userName,
//                 controller: userNameController,
//                 hideText: false,
//                 validator: (_email) {
//                   if (_email!.isEmpty) {
//                     return "please enter email id";
//                   } else {
//                     return "hi";
//                   }
//                 },
//                 onSaved: (String) {},
//               ),
//               //----------------------------------------ConfirmPassword textField
//               LoginTextField(
//                 size: 20,
//                 borderRadius: 13,
//                 borderColor: Colors.grey.shade400,
//                 fillColor: Colors.grey.shade200,
//                 padding: 20,
//                 labelText: confirmPassword,
//                 controller: userNameController,
//                 hideText: false,
//                 validator: (_email) {
//                   if (_email!.isEmpty) {
//                     return "please enter email id";
//                   } else {
//                     return "hi";
//                   }
//                 },
//                 onSaved: (String) {},
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 31,
//                 ),
//                 child:

//                     //----------------------------------------SignIn button
//                     LoginBtn(
//                   boxShadow1: const BoxShadow(
//                       color: Color.fromARGB(255, 0, 0, 0),
//                       offset: Offset(4.0, 4.0),
//                       blurRadius: 5,
//                       spreadRadius: 1.0),
//                   boxShadow2: const BoxShadow(
//                       color: Colors.black,
//                       offset: Offset(4.0, 4.0),
//                       blurRadius: 5,
//                       spreadRadius: 1.0),
//                   boxShadow3: const BoxShadow(
//                       color: Colors.black,
//                       offset: Offset(4.0, 4.0),
//                       blurRadius: 5,
//                       spreadRadius: 1.0),
//                   gradientColor1: Colors.black,
//                   gradientColor2: Colors.black,
//                   gradientColor3: Colors.black,
//                   borderRadius: 33,
//                   btnHeight: 55,
//                   btnWidth: width * 0.68,
//                   color: Colors.black,
//                   fontSize: 20,
//                   text: submit,
//                   textColor: Colors.white,
//                   onTab: () {
//                     Navigator.pushNamed(context, '/login');
//                   },
//                 ),
//               ),

//               //----------------------------------------Not a member SignUp
//               const SizedBox(
//                 height: 20,
//               ),
//               LoginTextButton(
//                 text: go_back,
//                 size: 20,
//                 color: Color.fromARGB(255, 2, 7, 147),
//                 onTab: () {
//                   Navigator.pushNamed(context, "/login");
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
