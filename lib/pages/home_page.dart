// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:delta/widgets/app_drawer.dart';
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
    return WillPopScope(
      onWillPop: () async {
        bool? result = await showExitPopup();
        return result;
      },
      child: Scaffold(
        backgroundColor: mainLightColor,
        drawer: AppDrawer(),
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

// Bottom Navigator

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
      ),
    );
  }

//------Service
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialog
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialog had returned null, then return false
  }
}
