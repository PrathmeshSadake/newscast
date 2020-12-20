import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:newscast/screens/article_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF393F47),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
              ),
            ),
          ),
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
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white54,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
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
                                  url: url,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xFFfe5612),
                    ),
                    child: Text(
                      'Read more',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
