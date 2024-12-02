import 'package:flutter/material.dart';
import '../widgets/news_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: NewsList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {  // "Search" is the second item in the list
            Navigator.pushNamed(context, '/search');
          } else if (index == 2) {  // "Bookmarks" is the third item in the list
            Navigator.pushNamed(context, '/bookmarks');
          }
        },
      ),
    );
  }
}
