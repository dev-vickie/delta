// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/firebase_options.dart';

import 'package:delta/auth/main_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final mainLightColor = Color.fromARGB(255, 78, 98, 134);
final mainDarkColor = Color.fromARGB(255, 0, 7, 20);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), (() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MainPage(),
      ));
    }));
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 7, 20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.book,
              color: Color.fromARGB(255, 78, 98, 134),
              size: 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: mainLightColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
