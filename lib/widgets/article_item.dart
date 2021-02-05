import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final String headline;
  final String description;
  final String source;
  final String webUrl;
  final String imageUrl;
  final String date;

  ArticleItem({
    this.headline,
    this.description,
    this.source,
    this.webUrl,
    this.imageUrl,
    this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )),
          Text(headline),
          Text(description),
          Text(source),
          Text(date),
        ],
      ),
    );
  }
}
