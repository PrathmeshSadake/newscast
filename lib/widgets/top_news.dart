import 'package:flutter/material.dart';

class TopNews extends StatelessWidget {
  final String imageUrl;
  final String title;

  TopNews({
    @required this.imageUrl,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF31353D),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              
              child: Image.network(imageUrl,)),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(title,textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),),
                ],
              )),
        ],
      ),
    );
  }
}
