import 'package:flutter/material.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/providers/category_provider.dart';
import 'package:log_in_ui/providers/order_provider.dart';
import 'package:log_in_ui/providers/product_provider.dart';
import 'package:log_in_ui/screen/getting_started_screen.dart';
import 'package:log_in_ui/screen/log_in_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>OrderProvider()),
        ChangeNotifierProvider(create: (context)=>CategoryProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
