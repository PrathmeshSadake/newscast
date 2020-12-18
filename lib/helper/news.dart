import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bca60ca4665a42e3b01d791bca670476';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["content"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=bca60ca4665a42e3b01d791bca670476';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            // publishedAt: element['publishedAt'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
