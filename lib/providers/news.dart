import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newscast/models/article.dart';
import 'package:intl/intl.dart';

class News extends ChangeNotifier {
  final String apiKey = "NGD0cMqsjnjd71XJOGkzlG3sxJ6CdMFl";
  final baseUrl = "https://api.nytimes.com/svc";

  List<Article> _topNews = [];
  List<Article> _worldNews = [];
  List<Article> _searchedNews = [];
  List<Article> _categoryNews = [];
  List<Article> _loadedItems = [];

  List<Article> get categoryNews {
    return [..._categoryNews];
  }

  List<Article> get worldNews {
    return [..._worldNews];
  }

  List<Article> get topNews {
    return [..._topNews];
  }

  String formatter(String date) {
    DateTime parsedDate = DateTime.parse(date);
    var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }

  // Future<void> getCategoriesNews(String category) async {
  //   final url =
  //       '$baseUrl/search/v2/articlesearch.json?q=$category&api-key=$apiKey';
  //   var response = await http.get(url);
  //   var jsonResponse = json.decode(response.body);
  //   // print(jsonResponse['response']['docs']);
  //   List extractedData = jsonResponse['response']['docs'];
  //   // print(extractedData);
  //   _loadedItems = [];
  //   extractedData.forEach((item) {
  //     _loadedItems.add(Article(
  //       headline: item['abstract'],
  //       source: item['source'],
  //       description: item['lead_paragraph'],
  //       date: formatter(item['pub_date']),
  //       imageUrl: item['multimedia'][0]['url'],
  //       webUrl: item['web_url'],
  //     ));
  //   });
  //   _categoryNews = _loadedItems;
  //   print(_categoryNews.length);
  // }
  Future<void> getCategoriesNews(String category) async {
    final url = '$baseUrl/topstories/v2/$category.json?api-key=$apiKey';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['results'];
    _loadedItems = [];
    extractedData.forEach((item) {
      _loadedItems.add(Article(
        headline: item['title'],
        source: item['byline'],
        description: item['abstract'],
        date: formatter(item['published_date']),
        imageUrl: item['multimedia'][0]['url'],
        webUrl: item['url'],
      ));
    });
    _categoryNews = _loadedItems;
  }

  Future<void> getTopNews() async {
    final url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bca60ca4665a42e3b01d791bca670476';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['articles'];
    _loadedItems = [];
    extractedData.forEach((item) {
      if (item['title'] != null &&
          item['author'] != null &&
          item['description'] != null &&
          item['urlToImage'] != null &&
          item['urlToImage'] != null) {
        _loadedItems.add(Article(
          headline: item['title'],
          source: item['author'],
          description: item['description'],
          date: formatter(item['publishedAt']),
          imageUrl: item['urlToImage'],
          webUrl: item['urlToImage'],
        ));
      }
    });
    _topNews = _loadedItems;
    print(_topNews.length);
  }

  Future<void> getWorldNews() async {
    final url = '$baseUrl/topstories/v2/world.json?api-key=$apiKey';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['results'];
    _loadedItems = [];
    extractedData.forEach((item) {
      _loadedItems.add(Article(
        headline: item['title'],
        source: item['byline'],
        description: item['abstract'],
        date: formatter(item['published_date']),
        imageUrl: item['multimedia'][0]['url'],
        webUrl: item['url'],
      ));
    });
    _worldNews = _loadedItems;
  }

  // Future<void> getTopNews() async {
  //   final url = '$baseUrl/topstories/v2/world.json?api-key=$apiKey';
  //   var response = await http.get(url);
  //   var jsonResponse = json.decode(response.body);
  //   List extractedData = jsonResponse['results'];
  //   _loadedItems = [];
  //   extractedData.forEach((item) {
  //     _loadedItems.add(Article(
  //       headline: item['title'],
  //       source: item['byline'],
  //       description: item['abstract'],
  //       date: formatter(item['published_date']),
  //       imageUrl: item['multimedia'][0]['url'],
  //       webUrl: item['url'],
  //     ));
  //   });
  //   _topNews = _loadedItems;
  // }
}
