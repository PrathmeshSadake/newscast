import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/searched_article.dart';
import '../providers/news.dart';

class SearchedArticleScreen extends StatefulWidget {
  final String searchField;
  SearchedArticleScreen({@required this.searchField});
  @override
  _SearchedArticleScreenState createState() => _SearchedArticleScreenState();
}

class _SearchedArticleScreenState extends State<SearchedArticleScreen> {
  bool _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<News>(context).getSearchedNews(widget.searchField).then((_) {
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
        iconTheme: IconThemeData(color: Color(0xFFAC7FFC)),
        backgroundColor: Color(0xFFF9FAFE),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'NEWSCAST',
          style: GoogleFonts.bioRhyme(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Consumer<News>(
                builder: (ctx, news, child) => ListView.builder(
                  itemCount: news.searchedNews.length,
                  itemBuilder: (ctx, index) {
                    return SearchedArticle(
                      headline: news.searchedNews[index].headline,
                      source: news.searchedNews[index].source,
                      webUrl: news.searchedNews[index].webUrl,
                      date: news.searchedNews[index].date,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
