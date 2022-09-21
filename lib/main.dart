// ignore_for_file: prefer_const_constructors

import 'package:delta/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyList(),
    );
  }
}

class MyList extends StatelessWidget {
  MyList({super.key}) {
    _stream = _reference.snapshots();
  }
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('users');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check if has error
          if (snapshot.hasError) {
            return Text('Some error has occured ${snapshot.error}');
          }
          //Check if has data
          if (snapshot.hasData) {
            //Get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the document into Maps
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'name': e['name'],
                      'town': e['town'],
                    })
                .toList();
            //Display the list-  *return
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  //Get the item at each index *outside the return
                  Map thisItem = items[index];
                  return ListTile(
                    //Fix the items properties in the list tile
                    title: Text('${thisItem['name']}'),
                    subtitle: Text('${thisItem['id']}'),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
