// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/main.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightColor,
      body: Column(
        children: [
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.supervisor_account_outlined),
          ),
          ListTile(
            title: Text('Notification Settings'),
            trailing: Icon(Icons.notifications),
          ),
          ListTile(
            title: Text('Choose Theme'),
            trailing: Icon(Icons.sunny),
          ),
          ListTile(
            trailing: Icon(Icons.question_mark),
            title: Text('FAQ\'s'),
          ),
          ListTile(
            trailing: Icon(Icons.share),
            title: Text('Share'),
          )
        ],
      ),
    );
  }
}
