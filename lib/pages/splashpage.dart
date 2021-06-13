// Splash Page
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:umva/pages/nowplaying.dart';
// Page imports
import 'overall.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => OverallPage(show: false,)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF06543),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(), 
              child: Container(
                width: 70.8,
                height: 70.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),

            Padding(
              padding: EdgeInsets.only(top: 10.0), 
              child: Center(
                child: Text('UMVA', style: GoogleFonts.dosis(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
              ),
          ],
        ),
        ),
    );
  }
}
