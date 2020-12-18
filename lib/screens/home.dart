import 'package:flutter/material.dart';
import 'package:newscast/helper/news.dart';
import 'package:newscast/models/article_model.dart';
import 'package:newscast/widgets/category_tile.dart';
import '../widgets/blog_tile.dart';
import 'package:newscast/widgets/top_news.dart';
import '../helper/data.dart';
import '../models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categories = List<Category>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

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
    return Scaffold(
      backgroundColor: Color(0xff252B32),
      appBar: AppBar(
        leading: Icon(Icons.bar_chart),
        title: Text('NEWSCAST', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20 ),
            child: Icon(Icons.language_sharp))
        ],
        backgroundColor: Color(0xff252B32),
      ),
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: TopNews(
                        imageUrl: articles[0].urlToImage,
                        title: articles[0].title,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF393F47),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.category, size: 20, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('Top Categories', style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),),
                            ],
                          ),
                          Wrap(
                            children: [
                              CategoryTile(
                                backgroundColor: categories[0].color,
                                categoryName: categories[0].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[1].color,
                                categoryName: categories[1].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[2].color,
                                categoryName: categories[2].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[3].color,
                                categoryName: categories[3].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[4].color,
                                categoryName: categories[4].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[5].color,
                                categoryName: categories[5].categoryName,
                              ),
                              CategoryTile(
                                backgroundColor: categories[6].color,
                                categoryName: categories[6].categoryName,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined, size: 20, color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("RECOMMENDED FOR YOU", style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),)
                            ],
                          ),
                          ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return BlogTile(
                                imageUrl: articles[index + 1].urlToImage,
                                title: articles[index + 1].title,
                                description: articles[index + 1].description,
                                url: articles[index + 1].url,
                                content: articles[index + 1].content,
                              );
                            },
                            itemCount: articles.length -1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
