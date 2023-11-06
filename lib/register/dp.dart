import 'package:flutter/material.dart';

class dp extends StatefulWidget {
  const dp({super.key});

  @override
  State<dp> createState() => _dpState();
}

class _dpState extends State<dp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Postit",
              style: TextStyle(
                fontFamily: "italic",
                fontWeight: FontWeight.w500,
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
