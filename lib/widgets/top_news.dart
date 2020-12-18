import 'package:flutter/material.dart';

class TopNews extends StatelessWidget {
  final String title;

  TopNews({
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 220.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white60,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF393F47),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
