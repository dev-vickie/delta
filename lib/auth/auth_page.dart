import 'package:delta/pages/login.dart';
import 'package:delta/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //Initially show login page
  bool showLoginPage = true;

  void switchScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: switchScreens);
    } else {
      return RegisterPage(showLoginPage: switchScreens);
    }
  }
}
