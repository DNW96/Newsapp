import 'package:flutter/material.dart';
import '../widgets/news_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookmarksScreen extends StatefulWidget {
  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List _bookmarkedArticles = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  void _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedBookmarks = prefs.getString('bookmarks');
    if (savedBookmarks != null) {
      setState(() {
        _bookmarkedArticles = json.decode(savedBookmarks);
      });
    }
  }

  void _removeBookmark(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bookmarkedArticles.removeAt(index);
      prefs.setString('bookmarks', json.encode(_bookmarkedArticles));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: _bookmarkedArticles.isEmpty
          ? Center(child: Text('No bookmarks yet'))
          : ListView.builder(
              itemCount: _bookmarkedArticles.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_bookmarkedArticles[index]['url']),
                  onDismissed: (_) => _removeBookmark(index),
                  child: NewsTile(article: _bookmarkedArticles[index]),
                );
              },
            ),
    );
  }
}
