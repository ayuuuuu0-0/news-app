import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/HomeScreen/homeScreen.dart';
import 'package:news_app/HomeScreen/landingPage.dart';

import '../welcome screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homeScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LandingPage()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/icon.jpeg',
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 1.7,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "News App",
                style: TextStyle(
                  fontSize: 40.0,
                  //fontStyle: FontStyle.italic,
                  fontFamily: "Poppins SemiBold",
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
                "An app for all kinds of news",
                style: TextStyle(
                  fontSize: 18.0,
                  //fontStyle: FontStyle.italic,
                  fontFamily: "Poppins SemiBold",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
