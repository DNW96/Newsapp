import 'package:flutter/material.dart';
import '../services/news_api.dart';
import '../widgets/news_tile.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsApi.fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching news'));
        } else {
          final articles = snapshot.data as List;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsTile(article: articles[index]);
            },
          );
        }
      },
    );
  }
}
