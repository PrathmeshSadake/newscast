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
      child: Column(
        children: [
          Image.network(imageUrl),
          SizedBox(
            height: 15,
          ),
          Text(title),
        ],
      ),
    );
  }
}