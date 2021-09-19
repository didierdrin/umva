// Main Page : Umva 1.0.0
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
// Page import
import 'pages/splashpage.dart';

void main() {
  //late List<MusicData> recentSearches;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              title: 'Umva',
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              home: SplashPage(),
            ));
  }
}
