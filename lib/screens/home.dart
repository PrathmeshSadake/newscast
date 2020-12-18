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
      text: "World",
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
          backgroundColor: Color(0xff252B32),
          appBar: AppBar(
            leading: Icon(Icons.bar_chart),
            title: Text('NEWSCAST',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w900, letterSpacing: 14)),
            elevation: 0,
            actions: [
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.language_sharp))
            ],
            backgroundColor: Color(0xff252B32),
            bottom:
                TabBar(isScrollable: true, controller: _controller, tabs: tabs),
          ),
          body: TabBarView(controller: _controller, children: [
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
          ])
          // : SingleChildScrollView(
          //     child: Container(
          //       child: Column(
          //         children: [
          //           Container(
          //             child: TopNews(
          //               imageUrl: articles[0].urlToImage,
          //               title: articles[0].title,
          //             ),
          //           ),
          //           Container(
          //             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: Color(0xFF393F47),
          //                 borderRadius: BorderRadius.all(Radius.circular(16))),
          //             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Icon(
          //                       Icons.category,
          //                       size: 20,
          //                       color: Colors.white,
          //                     ),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     Text(
          //                       'Top Categories',
          //                       style: TextStyle(
          //                           letterSpacing: 1,
          //                           fontSize: 20,
          //                           fontWeight: FontWeight.w600,
          //                           color: Colors.white),
          //                     ),
          //                   ],
          //                 ),
          //                 Wrap(
          //                   children: [
          //                     CategoryTile(
          //                       backgroundColor: categories[0].color,
          //                       categoryName: categories[0].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[1].color,
          //                       categoryName: categories[1].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[2].color,
          //                       categoryName: categories[2].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[3].color,
          //                       categoryName: categories[3].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[4].color,
          //                       categoryName: categories[4].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[5].color,
          //                       categoryName: categories[5].categoryName,
          //                     ),
          //                     CategoryTile(
          //                       backgroundColor: categories[6].color,
          //                       categoryName: categories[6].categoryName,
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           Container(
          //             padding: EdgeInsets.all(5.0),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   children: [
          //                     Icon(
          //                       Icons.thumb_up_alt_outlined,
          //                       size: 20,
          //                       color: Colors.white,
          //                     ),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     Text(
          //                       "RECOMMENDED FOR YOU",
          //                       style: TextStyle(
          //                           letterSpacing: 1,
          //                           fontSize: 20,
          //                           fontWeight: FontWeight.w600,
          //                           color: Colors.white),
          //                     )
          //                   ],
          //                 ),
          //                 ListView.builder(
          //                   physics: ClampingScrollPhysics(),
          //                   shrinkWrap: true,
          //                   itemBuilder: (ctx, index) {
          //                     return BlogTile(
          //                       imageUrl: articles[index + 1].urlToImage,
          //                       title: articles[index + 1].title,
          //                       description: articles[index + 1].description,
          //                       url: articles[index + 1].url,
          //                       content: articles[index + 1].content,
          //                     );
          //                   },
          //                   itemCount: articles.length - 1,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          // ),
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
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return TopNews(
                        title: widget.articles[index].title,
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return BlogTile(
                        imageUrl: widget.articles[index + 4].urlToImage,
                        title: widget.articles[index + 4].title,
                        description: widget.articles[index + 4].description,
                        url: widget.articles[index + 4].url,
                        content: widget.articles[index + 4].content,
                      );
                    },
                    itemCount: widget.articles.length - 5,
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
