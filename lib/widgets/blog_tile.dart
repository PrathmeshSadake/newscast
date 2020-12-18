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
        margin: EdgeInsets.fromLTRB(5, 10.0, 5, 0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFF393F47),
        ),
        child: Column(
          children: [
            ClipRRect(
               borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(imageUrl)),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
              children: [
                Text(title),
                Text(description),
              ],
            )),
            
          ],
        ),
      ),
    );
  }
}
