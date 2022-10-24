import 'package:delta/main.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainLightColor,
      child: Column(
        children: const [
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
    );
  }
}
