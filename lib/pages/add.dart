import 'package:crud_firebase_firestore_flutter/config/firebase.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Add extends StatefulWidget {
  //
  Add({Key key, this.db}) : super(key: key);
  Map contacts;
  Database db;
  //
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  //
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
        backgroundColor: Colors.pinkAccent[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                controller: nameController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Lastname",
                ),
                controller: lastnameController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                controller: emailController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Company",
                ),
                controller: companyController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "URL",
                ),
                controller: urlController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Birthday",
                ),
                controller: birthdayController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: "Relationship",
                ),
                controller: relationshipController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
            color: Colors.black,
            onPressed: () {
              widget.db.create(
                nameController.text,
                lastnameController.text,
                emailController.text,
                companyController.text,
                urlController.text,
                birthdayController.text,
                relationshipController.text,
              );
              Navigator.pop(context, true);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
