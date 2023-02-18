import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:log_in_ui/colors/mycolors.dart';


  customTextField(TextEditingController controller, IconData icon,
      String labelText, [bool isObscure=false, String Function(String?)?validator,
        Widget? suffixIcon]) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscure,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            suffixIcon: suffixIcon,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }


toastFunction(String title) {
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

customButton(Widget text, void Function() onTap, Color buttonColor, Color textColor){
    return  MaterialButton(
      elevation: 0,
      minWidth: double.maxFinite,
      height: 50,
      onPressed: onTap,
      color: buttonColor,
      child: text,
      textColor: textColor,
    );
}

String baseUrl = 'https://apihomechef.antopolis.xyz/api/admin/';
String imageUrl = 'https://apihomechef.antopolis.xyz/images/';
String token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY3MDk5NjgxMywiZXhwIjoxNjgzOTU2ODEzLCJuYmYiOjE2NzA5OTY4MTMsImp0aSI6IkZYdlNpekhnQ3Z3c203b1QiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.eudqZLbt5071XQkpTH9uGagyLUXTd5jxtKFU6cfF4Zs';
