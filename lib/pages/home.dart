import 'package:crud_firebase_firestore_flutter/config/firebase.dart';
import 'package:crud_firebase_firestore_flutter/pages/add.dart';
import 'package:crud_firebase_firestore_flutter/pages/view.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  Database db;
  //
  List docs = [];
  //
  initialize() {
    db = Database();
    db.initialize();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud con Firebase y Flutter'),
        backgroundColor: Colors.pinkAccent[400],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          initialize();
        },
        child: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => View(
                        contacts: docs[index],
                        db: db,
                      ),
                    ),
                    // Update
                  ).then((value) => {
                        if (value != null)
                          {
                            initialize(),
                          }
                      });
                },
                child: Card(
                  elevation: 5,
                  color: Colors.pink[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Fullname: ' +
                              docs[index]['name'] +
                              ' ' +
                              docs[index]['lastname'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Email: ' + docs[index]['email'],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Company: ' + docs[index]['company'],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // child: ListTile(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => View(
                  //           contacts: docs[index],
                  //           db: db,
                  //         ),
                  //       ),
                  //       // Update
                  //     ).then((value) => {
                  //           if (value != null)
                  //             {
                  //               initialize(),
                  //             }
                  //         });
                  //   },
                  //   contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  //   // Read
                  //   title: Text(
                  //     docs[index]['name'],
                  //   ),
                  //   subtitle: Text(
                  //     docs[index]['lastname'],
                  //   ),
                  // ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent[400],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Add(
                db: db,
              ),
            ),
          ).then((value) {
            if (value != null) {
              initialize();
            }
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
