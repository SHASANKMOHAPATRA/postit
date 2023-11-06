import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postit/register/dp.dart';
import 'package:postit/register/login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  int selected = 0;
  String date = "";
  Widget radiobutton(String text, int index) {
    return Container(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selected = index;
          });
        },
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: (selected == index) ? Colors.black : Colors.white,
        ),
        child: Container(
          height: 30,
          width: 70,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              text,
              style: TextStyle(
                color: (selected == index) ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Postit",
              style: TextStyle(
                fontFamily: "italic",
                fontSize: 50,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "ENTER USERNAME",
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "ENTER EMAIL",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "ENTER PASSWORD",
                    prefixIcon: Icon(Icons.key_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Gender :",
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  radiobutton("Male", 1),
                  SizedBox(
                    width: 10,
                  ),
                  radiobutton("Female", 2),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(
                    "Birth Date :",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    DateTime? datepicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1947),
                        lastDate: DateTime(2024));
                    if (datepicked != null) {
                      setState(() {
                        date =
                            "${datepicked.day}-${datepicked.month}-${datepicked.year}";
                      });
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffEEEEEE)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            date == "" ? "Choose a date" : "$date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "poppins"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => dp()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => login()));
              },
              child: Text(
                "Already have an account? LOG IN",
                style: TextStyle(
                    fontFamily: "poppins",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
