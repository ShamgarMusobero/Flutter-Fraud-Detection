import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'home.dart';
import 'download.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  int selectedItemIndex = 0;

  // ignore: prefer_final_fields

  // ignore: prefer_final_fields
  List<Widget> _widgets = [HomePage(), DownPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: _widgets[selectedItemIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Add Details'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Download'),
          ],
          currentIndex: selectedItemIndex,
          onTap: (int index) {
            setState(() {
              selectedItemIndex = index;
            });
          }),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
