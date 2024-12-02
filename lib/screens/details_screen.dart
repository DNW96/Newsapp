import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map article;

  DetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section (only if the image URL is not null)
              if (article['urlToImage'] != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for image
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      article['urlToImage'],
                      fit: BoxFit.cover,
                      height: 250, // Fixed height for the image
                      width: double.infinity,
                    ),
                  ),
                ),
              SizedBox(height: 16),

              // Title section with Box styling
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  article['title'] ?? 'No Title',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8),

              // Published date section
              if (article['publishedAt'] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    article['publishedAt'] ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
              SizedBox(height: 16),

              // Description section
              if (article['description'] != null)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Text(
                    article['description'] ?? 'No Description',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              SizedBox(height: 16),

              // Content section with Box styling
              if (article['content'] != null)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Text(
                    article['content'] ?? 'No Content Available',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.justify,
                  ),
                ),
              SizedBox(height: 24),

              // Bookmark button
              ElevatedButton(
                onPressed: () {
                  // Implement bookmarking logic here
                  print("Article Bookmarked: ${article['title']}");
                  // Add functionality to save this article to the bookmarks list
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Bookmark This Article',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 16),

              // Go back button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Go Back',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
