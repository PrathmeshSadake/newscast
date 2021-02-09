import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/news.dart';
import '../widgets/article_item.dart';

class TopWorldNews extends StatefulWidget {
  @override
  _TopWorldNewsState createState() => _TopWorldNewsState();
}

class _TopWorldNewsState extends State<TopWorldNews> {
  bool _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context).getWorldNews().then((_) {
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
          'World News',
          style: GoogleFonts.bioRhyme(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Consumer<News>(
                builder: (ctx, news, child) => ListView.builder(
                  itemCount: news.worldNews.length,
                  itemBuilder: (ctx, index) => ArticleItem(
                    headline: news.worldNews[index].headline,
                    description: news.worldNews[index].description,
                    source: news.worldNews[index].source,
                    webUrl: news.worldNews[index].webUrl,
                    imageUrl: news.worldNews[index].imageUrl,
                    date: news.worldNews[index].date,
                  ),
                ),
              ),
            ),
    );
  }
}
