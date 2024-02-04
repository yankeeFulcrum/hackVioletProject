// Assuming this code is placed in lib/post_page.dart

import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final List<String> comments;

  const PostPage({
    Key? key,
    required this.title,
    this.description = '',
    this.imageUrl = 'https://via.placeholder.com/400',
    this.rating = 0.0,
    this.comments = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Add more widgets as needed ...
          ],
        ),
      ),
    );
  }
}
