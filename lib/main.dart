// Main Page : Umva 1.0.0
import 'package:flutter/material.dart';
import 'package:umva/pages/musicData.dart';
// Page import
import 'pages/splashpage.dart';

void main() {
  //late List<MusicData> recentSearches;
  runApp(MyApp(recentSearches: [],));
}

class MyApp extends StatelessWidget {
  final List<MusicData> recentSearches;
  MyApp({Key? key, required this.recentSearches}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashPage(
        recentSearches: [],
      ),
    );
  }
}
