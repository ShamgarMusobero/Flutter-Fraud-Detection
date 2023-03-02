import 'package:flutter/material.dart';

class DownPage extends StatefulWidget {
  @override
  _DownPageState createState() => _DownPageState();
}

class _DownPageState extends State<DownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Download",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {},
              child: Text(
                'Subscribe',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
