import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

class NewsTile extends StatelessWidget {
  final Map article;
  NewsTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Added shadow for the card to make it more prominent
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Better margin around the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for the card
      ),
      child: InkWell(
        onTap: () {
          // Navigate to details screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailsScreen(article: article)),
          );
        },
        borderRadius: BorderRadius.circular(12), // Same border radius as the card
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Padding inside the card for spacing
          child: Row(
            children: [
              // Displaying the article image
              article['urlToImage'] != null && article['urlToImage'] != ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded image corners
                      child: Image.network(
                        article['urlToImage'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300], // Placeholder color for no image
                      child: Icon(Icons.image, color: Colors.white, size: 40),
                    ),
              SizedBox(width: 12), // Space between the image and text
              // Title and description of the article
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article['title'] ?? 'No Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8), // Space between title and description
                    Text(
                      article['description'] ?? 'No Description',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
