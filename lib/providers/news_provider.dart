import 'package:flutter/material.dart';
import '../services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List _articles = [];
  List get articles => _articles;

  void fetchArticles(String? query, String? category) async {
    _articles = await NewsApi.fetchNews(query: query, category: category);
    notifyListeners();
  }
}
