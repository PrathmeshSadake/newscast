import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:newscast/helper/news.dart';
import 'package:newscast/models/article_model.dart';
import 'package:newscast/models/category_model.dart';
import 'package:newscast/screens/category_news.dart';
import 'package:newscast/widgets/world_news.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    if (mounted) {
      super.initState();
      _controller = TabController(length: tabs.length, vsync: this);
      getDate();
      getNews();
      _controller.addListener(() {
        print(
          _controller.index.toString(),
        );
      });
    }
  }

  List<Widget> tabs = [
    Tab(
      text: "Top Headlines",
    ),
    Tab(
      text: "Business",
    ),
    Tab(
      text: "General",
    ),
    Tab(
      text: "Sports",
    ),
    Tab(
      text: "Entertainment",
    ),
    Tab(
      text: "Health",
    ),
    Tab(
      text: "Technology",
    ),
    Tab(
      text: "Science",
    )
  ];

  List<Category> categories = List<Category>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;
  String formattedDate = '';
  String formattedDay = '';

  getNews() async {
    News newsClass = News();
    while (mounted) {
      await newsClass.getNews();
      articles = newsClass.news;
      setState(() {
        _loading = false;
      });
    }
  }

  getDate() {
    while (mounted) {
      var now = new DateTime.now();
      var formatter = new DateFormat('dd-MM-yyyy');
      var day = new DateFormat('EEEE').format(now);
      setState(() {
        formattedDate = formatter.format(now);
        formattedDay = day;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(14),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          title: Center(
            child: Text(
              'NEWSCAST',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                letterSpacing: 6,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          elevation: 0,
          actions: [
            Opacity(
              opacity: 0.0,
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.language_sharp,
                ),
              ),
            )
          ],
          bottom:
              TabBar(isScrollable: true, controller: _controller, tabs: tabs),
        ),
        body: Container(
          color: Color(0xff141414),
          child: TabBarView(controller: _controller, children: [
            WorldNews(
              articles: articles,
              isLoading: !_loading,
              date: formattedDate,
              day: formattedDay,
            ),
            CategoryNews(
              category: 'business',
            ),
            CategoryNews(
              category: 'general',
            ),
            CategoryNews(
              category: 'sports',
            ),
            CategoryNews(
              category: 'entertainment',
            ),
            CategoryNews(
              category: 'health',
            ),
            CategoryNews(
              category: 'technology',
            ),
            CategoryNews(
              category: 'science',
            ),
          ]),
        ),
      ),
    );
  }
}




