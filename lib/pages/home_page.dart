// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: mainLightColor,
      drawer: Drawer(
        backgroundColor: mainLightColor,
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DeltaNotes',
          style:
              GoogleFonts.notoSans(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainDarkColor,
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainDarkColor,
        selectedIconTheme: IconThemeData(color: mainDarkColor),
        backgroundColor: mainLightColor,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedLabelStyle: GoogleFonts.notoSans(
            color: mainLightColor, fontSize: 17, fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle:
            GoogleFonts.notoSans(fontSize: 17, fontWeight: FontWeight.bold),
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
