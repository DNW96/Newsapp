import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  static const _baseUrl = 'https://newsapi.org/v2';
  static const _apiKey = '09bed7b90eda41d6baac6ee70e381e26';

  static Future<List> fetchNews({String? query, String? category}) async {
    final url = '$_baseUrl/top-headlines?apiKey=$_apiKey&${query != null ? "q=$query&" : ""}${category != null ? "category=$category&" : ""}country=us';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
