import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key? key,
      required this.title,
      required this.author,
      required this.description,
      required this.content,
      required this.urlToImage})
      : super(key: key);

  final String title;
  final String author;
  final String description;
  final String content;
  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            'by ' + author,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: Image.network(urlToImage, fit: BoxFit.cover),
            width: 350,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            width: 350,
            child: Text(
              content,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
