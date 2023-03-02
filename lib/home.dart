import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController ID_number = new TextEditingController();

  TextEditingController Guardian_Name = new TextEditingController();
  TextEditingController Guardian_SurName = new TextEditingController();
  TextEditingController Guardian_ID = new TextEditingController();

  TextEditingController Guardian_SecName = new TextEditingController();
  TextEditingController Guardian_SecSurName = new TextEditingController();
  TextEditingController Guardian_SecID = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: surname,
              decoration: InputDecoration(
                  labelText: "Surname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: ID_number,
              decoration: InputDecoration(
                  labelText: "ID_Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_Name,
              decoration: InputDecoration(
                  labelText: "First Guardian Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_SurName,
              decoration: InputDecoration(
                  labelText: "Guardian Surname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_ID,
              decoration: InputDecoration(
                  labelText: "Guardian ID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_SecName,
              decoration: InputDecoration(
                  labelText: "Second Guardian Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_SecSurName,
              decoration: InputDecoration(
                  labelText: "Guardian Surname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: Guardian_SecID,
              decoration: InputDecoration(
                  labelText: "Guardian_SecID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "name": name.text,
                    "surname": surname.text,
                    "ID_number": ID_number.text,
                    "Guardian_Name": Guardian_Name.text,
                    "Guardina_Surname": Guardian_SurName.text,
                    "Guardian_ID": Guardian_ID.text,
                    "Guardian_SecName": Guardian_SecName.text,
                    "Guardian_SecSurName": Guardian_SecSurName.text,
                    "Guardian_SecID": Guardian_SecID.text
                  };

                  User? user = FirebaseAuth.instance.currentUser;
                  var kk = FirebaseFirestore.instance
                      .collection('users')
                      .doc(user!.uid)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .update(data);
                  });
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
