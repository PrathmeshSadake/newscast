import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/news.dart';
import '../widgets/article_item.dart';

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
        iconTheme: IconThemeData(color: Color(0xFFAC7FFC)),
        backgroundColor: Color(0xFFF9FAFE),
        elevation: 0,
        title: Text(
          widget.categoryName.toUpperCase(),
          style: GoogleFonts.bioRhyme(
            fontSize: 21,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
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
