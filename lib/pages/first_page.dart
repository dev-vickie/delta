// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    //IDK why this list works inside the build{} method!
    final List categories = [
      'Category 1',
      'Category 2',
    ];
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 200,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              //color: Color.fromARGB(255, 0, 7, 20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            //color: Colors.white,
                            color: Color.fromARGB(255, 78, 98, 134),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'view all',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 230,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 78, 98, 134),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
