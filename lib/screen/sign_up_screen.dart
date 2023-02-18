// import 'package:flutter/material.dart';
// import 'package:log_in_ui/colors/mycolors.dart';
// import 'package:log_in_ui/reusable/reusable.dart';
// import 'package:log_in_ui/screen/log_in_screen.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   CustomTextField _textField = CustomTextField();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   bool isVisibility = false;
//   bool isObsicure=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         backgroundColor: buttonClr,
//         body: Container(
//           alignment: Alignment.topCenter,
//           margin: EdgeInsets.symmetric(horizontal: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Sign up to Guraguri and continue',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 28),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Enter your email and password below to continue to the GuraGuri and let the travelling begin!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white, fontSize: 14),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 _textField.buildTextField(
//                     nameController, Icons.account_circle, 'Email', false),
//                 SizedBox(height: 20),
//                 _textField.buildTextField(
//                   passwordController,
//                   Icons.lock,
//                   'Password',
//                   isVisibility == true ? isObsicure : !isObsicure,
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isVisibility = !isVisibility;
//                         });
//                       },
//                       icon: isVisibility == true
//                           ? Icon(Icons.visibility)
//                           : Icon(Icons.visibility_off)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 _textField.buildTextField(
//                   confirmPasswordController,
//                   Icons.lock,
//                   'Confirm Password',
//                   isVisibility == true ? isObsicure : !isObsicure,
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isVisibility = !isVisibility;
//                         });
//                       },
//                       icon: isVisibility == true
//                           ? Icon(Icons.visibility)
//                           : Icon(Icons.visibility_off)),
//                 ),
//                 SizedBox(height: 30),
//                 MaterialButton(
//                   elevation: 0,
//                   minWidth: double.maxFinite,
//                   height: 50,
//                   onPressed: () {},
//                   color: logoGreen,
//                   child: Text('Sign up',
//                       style: TextStyle(color: Colors.white, fontSize: 16)),
//                   textColor: Colors.white,
//                 ),
//                 SizedBox(height: 20),
//                 MaterialButton(
//                   elevation: 0,
//                   minWidth: double.maxFinite,
//                   height: 50,
//                   onPressed: () {
//                     //Here goes the logic for Google SignIn discussed in the next section
//                   },
//                   color: Colors.blue,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Icon(
//                         Icons.g_mobiledata_outlined,
//                         size: 35,
//                       ),
//                       SizedBox(width: 8),
//                       Text('Sign-in using Google',
//                           style: TextStyle(color: Colors.white, fontSize: 16)),
//                     ],
//                   ),
//                   textColor: Colors.white,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already have an account?',
//                       style: TextStyle(fontSize: 16, color: scaffoldClr),
//                     ),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => LoginScreen()));
//                         },
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: scaffoldClr,
//                               fontWeight: FontWeight.bold),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
