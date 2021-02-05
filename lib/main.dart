import 'package:flutter/material.dart';
import 'package:newscast/models/category.dart';
import 'package:newscast/providers/categories.dart';
import 'package:newscast/providers/news.dart';
import 'package:provider/provider.dart';
import './screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF93B2FE),
          primaryColorLight: Color(0xFFCCCFF5),
          accentColor: Color(0xFFAC7FFC),
          textTheme: TextTheme(),
          backgroundColor: Color(0xFFF9FAFE),
          buttonColor: Color(0xFFF595B8),
        ),
        home: Homepage(),
      ),
    );
  }
}

/*
COLOR SCHEMES 
white : #F9FAFE
blue : #93B2FE
purple : #AC7FFC
pink : #F595B8
light: #CCCFF5
 */
