import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newscast/helper/news.dart';
import 'package:newscast/models/article_model.dart';
import '../widgets/blog_tile.dart';
import 'package:newscast/widgets/top_news.dart';
import '../models/category_model.dart';
import './category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;
  // int _selectedTab = 0;

  @override
  void initState() {
    if (mounted) {
      super.initState();
      _controller = TabController(length: tabs.length, vsync: this);
      //categories = getCategories();
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

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'assets/images/logo.png',
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

class WorldNews extends StatefulWidget {
  final List<ArticleModel> articles;
  final bool isLoading;
  WorldNews({@required this.articles, this.isLoading});
  @override
  _WorldNewsState createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? SingleChildScrollView(
            child: Column(
              children: [
                TopStories(widget: widget),
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
              child: SpinKitFadingCircle(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
                size: 20.0,
              ),
            ),
          );
  }
}

class TopStories extends StatelessWidget {
  TopStories({
    @required this.widget,
  });

  final WorldNews widget;

  final List<Color> _colors = [
    Color(0xFF19249f),
    Color(0xFFffba57),
    Color(0xFFa00058),
    Color(0xFFecd000),
    Color(0xFFe69a28),
    Color(0xFF5564ec),
    Color(0xFFfe5612),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
        // color: Color(0xFF393f47),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 130.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return TopNews(
              title: widget.articles[index].title,
              color: _colors[index],
              imageUrl: widget.articles[index].urlToImage,
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
