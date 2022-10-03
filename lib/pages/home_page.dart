// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/main.dart';
import 'package:delta/pages/first_page.dart';
import 'package:delta/pages/second_page.dart';
import 'package:delta/pages/third_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPage = 0;
  void _pageNavigator(index) {
    setState(() {
      currentPage = index;
    });
  }

  final List _pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainDarkColor,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: mainDarkColor,
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: mainLightColor),
        elevation: 0,
        backgroundColor: mainDarkColor,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(color: mainLightColor),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: mainLightColor),
        onTap: _pageNavigator,
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_applications), label: 'Settings'),
        ],
      ),
    );
  }
}
