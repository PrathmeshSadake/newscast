import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news.dart';
import './article_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies(){
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
     Provider.of<News>(context).getTopNews().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Consumer<News>(
              builder: (ctx, news, child) => ListView.builder(
                itemCount: news.topNews.length,
                itemBuilder: (ctx, index) => ArticleItem(
                  headline: news.topNews[index].headline,
                  description: news.topNews[index].description,
                  source: news.topNews[index].source,
                  webUrl: news.topNews[index].webUrl,
                  imageUrl: news.topNews[index].imageUrl,
                  date: news.topNews[index].date,
                ),
              ),
            ),
          );
  }
}
