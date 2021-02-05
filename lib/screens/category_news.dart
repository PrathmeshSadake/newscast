import 'package:flutter/material.dart';
import 'package:newscast/providers/news.dart';
import 'package:newscast/widgets/article_item.dart';
import 'package:provider/provider.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String categoryName;
  CategoryNewsScreen({this.categoryName});
  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  bool _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context)
          .getCategoriesNews(widget.categoryName)
          .then((_) {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categoryName),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<News>(
              builder: (ctx, news, child) => ListView.builder(
                itemCount: news.categoryNews.length,
                itemBuilder: (ctx, index) => ArticleItem(
                  headline: news.categoryNews[index].headline,
                  description: news.categoryNews[index].description,
                  source: news.categoryNews[index].source,
                  webUrl: news.categoryNews[index].webUrl,
                  imageUrl: news.categoryNews[index].imageUrl,
                  date: news.categoryNews[index].date,
                ),
              ),
            ),
    );
  }
}
