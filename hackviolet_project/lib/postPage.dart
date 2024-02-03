// lib/post_page.dart

import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example data
    final String imageUrl = 'https://www.hashtagboatlife.com/wp-content/uploads/2021/01/rigid-inflatable-dinghy-powerful.jpg';
    final String title = 'Dinghy Club';
    final String description =
        'This is a description of the horrible time I had.';
    final double rating = 4.5; // Out of 5
    final List<String> comments = [
      'Hated it.',
      'Loved it so much hazing!!',
      'Super fun parties!',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dinghy Club',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                imageUrl),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const ExpansionTile(
          title: Text('Comments'),
          leading: Icon(Icons.message),
          controlAffinity: ListTileControlAffinity.leading,
          children: <Widget>[
            ListTile(title: Text('Hated it.'),
            subtitle: Text('Romey Rome'),),
            ListTile(title: Text('Loved it so much hazing!!'),
            subtitle: Text('Brian')),
            ListTile(title: Text('Super fun parties!'),
            subtitle: Text('w00p')),
          ],
        ),
        
      ],
    )));
  }
}
