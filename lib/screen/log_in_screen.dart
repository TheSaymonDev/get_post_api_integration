import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/reusable/reusable.dart';
import 'package:log_in_ui/screen/getting_started_screen.dart';
import 'package:log_in_ui/screen/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    isLogIn();
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = false;
  bool isObsicure = false;


  isLogIn() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if(sharedPreferences.getString('token')!=null){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
              (route) => false);
    }
  }


  getLogIn() async {
   try{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String link = 'https://apihomechef.antopolis.xyz/api/admin/sign-in';
     var map = Map<String, dynamic>();
     map['email'] = emailController.text.toString();
     map['password'] = passwordController.text.toString();
     var response = await http.post(Uri.parse(link), body: map);
     var data = jsonDecode(response.body);
     print('access token is = ${data['access_token']} =');
     if (data['access_token'] != null) {
       sharedPreferences.setString('token', data['access_token']);
       print(
           'data saved in sharedPreferences = ${sharedPreferences.getString('token')}');
       Navigator.of(context).pushAndRemoveUntil(
           MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
               (route) => false);
     } else {
       toastFunction('Password doesn\'t match');
     }
   }catch(e){
     print(e);
   }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: buttonClr,
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign in to Guraguri and continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your email and password below to continue to the GuraGuri and let the travelling begin!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  customTextField(
                    emailController,
                    Icons.account_circle,
                    'Email',
                    false,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return '';
                    },
                  ),
                  SizedBox(height: 20),
                  customTextField(
                    passwordController,
                    Icons.lock,
                    'Password',
                    isVisibility == true ? isObsicure : !isObsicure,
                    (value) {
                      if (value!.isEmpty) {
                        return 'Please enter paassword';
                      }
                      return '';
                    },
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                        icon: isVisibility == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                  SizedBox(height: 30),
                  customButton(Text('Sign in'), () {
                    if (_formKey.currentState!.validate()) {
                    }
                    getLogIn();

                  }, logoGreen, scaffoldClr),
                  // MaterialButton(
                  //   elevation: 0,
                  //   minWidth: double.maxFinite,
                  //   height: 50,
                  //   onPressed: () {
                  //     if (_formKey.currentState!.validate()) {
                  //     }
                  //     getLogIn();
                  //
                  //   },
                  //   color: logoGreen,
                  //   child: Text('Sign in',
                  //       style: TextStyle(color: Colors.white, fontSize: 16)),
                  //   textColor: Colors.white,
                  // ),
                  SizedBox(height: 20),
                  customButton(Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.g_mobiledata_outlined,
                        size: 35,
                      ),
                      SizedBox(width: 8),
                      Text('Sign-in using Google',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ), () { }, logoGreen, scaffoldClr),
                  // MaterialButton(
                  //   elevation: 0,
                  //   minWidth: double.maxFinite,
                  //   height: 50,
                  //   onPressed: () {
                  //     //Here goes the logic for Google SignIn discussed in the next section
                  //   },
                  //   color: Colors.blue,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Icon(
                  //         Icons.g_mobiledata_outlined,
                  //         size: 35,
                  //       ),
                  //       SizedBox(width: 8),
                  //       Text('Sign-in using Google',
                  //           style:
                  //               TextStyle(color: Colors.white, fontSize: 16)),
                  //     ],
                  //   ),
                  //   textColor: Colors.white,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 16, color: scaffoldClr),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 16,
                                color: scaffoldClr,
                                fontWeight: FontWeight.bold),
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
