import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/category_screen.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/order_screen.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/product_screen.dart';
import 'package:log_in_ui/bottom_nav_bar_screen/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    OrderScreen(),
    CategoryScreen(),
    ProductScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 6,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Order',
                ),
                GButton(
                  icon: Icons.category,
                  text: 'Category',
                ),
                GButton(
                  icon: Icons.accessibility_new_sharp,
                  text: 'Product',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
