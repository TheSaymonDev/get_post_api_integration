import 'package:flutter/material.dart';
import 'package:log_in_ui/colors/mycolors.dart';
import 'package:log_in_ui/http_request/custom_http.dart';
import 'package:log_in_ui/screen/log_in_screen.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  Custom_http data=Custom_http();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: buttonClr,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            Image.asset(
              'images/logo.png',
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            Text(
              'Welcome to GuraGuri',
              textAlign: TextAlign.center,
              style: TextStyle(color: scaffoldClr, fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'A one-stop portal for you to travel the beautiful place from SCRATCH',
              textAlign: TextAlign.center,
              style: TextStyle(color: scaffoldClr, fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            //Our MaterialButton which when pressed will take us to a new screen named as
            //LoginScreen
            MaterialButton(
              elevation: 10,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              color: iconClr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',
                      style: TextStyle(color: scaffoldClr, fontSize: 20)),
                  SizedBox(width: 8,),
                  Icon(Icons.arrow_forward_ios, size: 18,)
                ],
              ),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
