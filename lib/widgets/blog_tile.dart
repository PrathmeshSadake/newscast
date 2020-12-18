import 'package:flutter/material.dart';
import 'package:newscast/screens/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String content;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => ArticleView(
                      imageUrl: imageUrl,
                      title: title,
                      desc: description,
                      content: content,
                    )));
      },
      child: Container(
        child: Column(
          children: [
            Image.network(imageUrl),
            Text(title),
            Text(description),
          ],
        ),
      ),
    );
  }
}
