// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _textController = TextEditingController();
  final mainLightColor = Color.fromARGB(255, 78, 98, 134);
  final mainDarkColor = Color.fromARGB(255, 0, 7, 20);
  String category = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TextField Test

          //Category name
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Input Category name ",
                hintStyle: TextStyle(color: mainDarkColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          //Description
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Description ",
                hintStyle: TextStyle(color: mainDarkColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          //paste the link
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Paste a file's link ",
                hintStyle: TextStyle(color: mainDarkColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          //upload - from internal storage

          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 98, 134),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Upload from device',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          //Submit
          GestureDetector(
            onTap: () {
              category = _textController.text;
            },
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 125, 205, 230),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Submit',
                        style: TextStyle(
                          color: Color.fromARGB(255, 78, 98, 134),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.add_task_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CreateCategory extends StatelessWidget {
//   const CreateCategory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Container(
//           height: 200,
//           width: MediaQuery.of(context).size.width,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
