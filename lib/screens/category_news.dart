import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:newscast/helper/news.dart';
import 'package:newscast/models/article_model.dart';
import 'package:newscast/widgets/blog_tile.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      getNews();
    }
  }

  getNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            child: Center(
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    },
                    itemCount: articles.length,
                  ),
                ),
              ],
            ),
          );
  }
}
