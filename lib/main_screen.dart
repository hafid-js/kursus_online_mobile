import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/cart/cart.dart';
import 'package:kursus_online_mobile/features/home/home.dart';
import 'package:kursus_online_mobile/features/enrolled_course/screens/enrolled_course_screen.dart';
import 'package:kursus_online_mobile/features/profile/screen/profile.dart';
import 'package:kursus_online_mobile/features/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    EnrolledCourseScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: UColors.backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: UColors.darkGrey,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.star_rounded, size: 25),
              icon: Icon(Icons.star_outline_rounded, size: 25),
              label: 'Featured',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: 25),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.play_circle_rounded, size: 25),
              icon: Icon(Icons.play_circle_outline_rounded, size: 25),
              label: 'My learning',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart_rounded, size: 25),
              icon: Icon(Icons.shopping_cart_outlined, size: 25),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle_rounded, size: 25),
              icon: Icon(Icons.account_circle_outlined, size: 25),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
