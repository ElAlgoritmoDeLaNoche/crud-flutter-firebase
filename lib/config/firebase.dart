import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore;
  initialize() {
    firestore = FirebaseFirestore.instance;
  }

  // ignore: missing_return
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('contacts').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "lastname": doc['lastname'],
            "email": doc['email'],
            "company": doc['company'],
            "url": doc['url'],
            "birthday": doc['birthday'],
            "relationship": doc['relationship'],
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> update(String id, String name, String lastname, String email,
      String company, String url, String birthday, String relationship) async {
    try {
      await firestore.collection('contacts').doc(id).update(
        {
          'name': name,
          'lastname': lastname,
          'email': email,
          'company': company,
          'url': url,
          'birthday': birthday,
          'relationship': relationship
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void create(String name, String lastname, String email, String company,
      String url, String birthday, String relationship) async {
    try {
      await firestore.collection('contacts').add(
        {
          'name': name,
          'lastname': lastname,
          'email': email,
          'company': company,
          'url': url,
          'birthday': birthday,
          'relationship': relationship
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void delete(String id) async {
    try {
      await firestore.collection('contacts').doc(id).delete();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
