import 'dart:convert';
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

  String formatter(String date) {
    DateTime parsedDate = DateTime.parse(date);
    var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }

  Future<void> getWorldNews() async {
    final url = '$baseUrl/topstories/v2/world.json?api-key=$apiKey';
    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    List extractedData = jsonResponse['results'];
    List<Article> _loadedItems = [];
    extractedData.forEach((item) {
      _loadedItems.add(Article(
        id: item['created_date'],
        headline: item['title'],
        source: item['byline'],
        description: item['abstract'],
        date: formatter(item['published_date']),
        imageUrl: item['multimedia'][0][url],
        webUrl: item['url'],
      ));
    });
    _worldNews = _loadedItems;
    // _worldNews.forEach((item) => print(item.headline));
  }
}
