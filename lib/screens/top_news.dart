import 'package:flutter/material.dart';

class TopNews extends StatefulWidget {
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
      ),
    );
  }
}
