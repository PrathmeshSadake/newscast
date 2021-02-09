import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/article.dart';
import '../models/searchedArticle.dart';

class News extends ChangeNotifier {
  final String apiKey = "NGD0cMqsjnjd71XJOGkzlG3sxJ6CdMFl";
  final baseUrl = "https://api.nytimes.com/svc";

  List<Article> _topNews = [];
  List<Article> _worldNews = [];
  List<SearchedArticle> _searchedNews = [];
  List<SearchedArticle> _loadingItems = [];
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

  List<SearchedArticle> get searchedNews {
    return [..._searchedNews];
  }

  String formatter(String date) {
    DateTime parsedDate = DateTime.parse(date);
    var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }

  Future<void> getSearchedNews(String category) async {
    final url =
        '$baseUrl/search/v2/articlesearch.json?q=$category&api-key=$apiKey';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['response']['docs'];
    _loadedItems = [];
    extractedData.forEach((item) {
      _loadingItems.add(SearchedArticle(
        headline: item['abstract'],
        source: item['source'],
        date: formatter(item['pub_date']),
        webUrl: item['web_url'],
      ));
    });
    _searchedNews = _loadingItems;
  }

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
          webUrl: item['url'],
        ));
      }
    });
    _topNews = _loadedItems;
    print(_topNews.length + 1);
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
}
