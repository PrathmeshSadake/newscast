import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/categories.dart';
import './providers/news.dart';
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
          backgroundColor: Color(0xFFFFFFFF),
        ),
        home: Homepage(),
      ),
    );
  }
}
