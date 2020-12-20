import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:newscast/models/article_model.dart';
import 'package:newscast/widgets/blog_tile.dart';
import 'package:newscast/widgets/top_stories.dart';

class WorldNews extends StatefulWidget {
  final List<ArticleModel> articles;
  final bool isLoading;
  final String date;
  final String day;
  WorldNews({@required this.articles, this.isLoading, this.date, this.day});
  @override
  _WorldNewsState createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.day}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            color: Colors.yellow,
                            fontSize: 30,
                            letterSpacing: 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0, top: 5),
                        child: Text(
                          widget.date,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),
                ),
                TopStories(widget: widget),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.language_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'News Today',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return BlogTile(
                        imageUrl: widget.articles[index + 3].urlToImage,
                        title: widget.articles[index + 3].title,
                        description: widget.articles[index + 3].description,
                        url: widget.articles[index + 3].url,
                      );
                    },
                    itemCount: widget.articles.length - 4,
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: Center(
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          );
  }
}
