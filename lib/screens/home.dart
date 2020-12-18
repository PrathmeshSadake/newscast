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
      appBar: AppBar(
        title: Text('Newscast'),
        elevation: 0,
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
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Wrap(
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
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
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
                        itemCount: articles.length - 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
