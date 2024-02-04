import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'dart:math';

class OrgPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String rating;
  final Map<String, List<String>> comments;

  OrgPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.comments,
  }) : super(key: key);

final randomNames = RandomNames(Zone.us);

  @override
  Widget build(BuildContext context) {
    List<String> commentsList =
        comments.containsKey(title) ? comments[title]! : [];
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                rating,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ExpansionTile(
              title: Text('Comments'),
              leading: Icon(Icons.message),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                for (String comment in commentsList)
                
                    ListTile(
                    
                    title: Text(comment),
                    subtitle: Text(randomNames.fullName()),
                    leading: Text(Random().nextInt(5).toString() + '/5'))
              
                  
                  ,
                ],
              ),
          ]),
        )],
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String comment;
  const CommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(comment),
    );
  }
}
