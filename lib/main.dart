import 'package:flutter/material.dart';

import 'package:newscast/screens/home.dart';
import 'package:newscast/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newscast',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
      },
    );
  }
}
