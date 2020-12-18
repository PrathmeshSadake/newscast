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
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      padding: EdgeInsets.fromLTRB(5,5,5,20),
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
              padding: EdgeInsets.only(left: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Color(0xFFffba57),
                        ),
                        child: Text(
                          'Read more',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
