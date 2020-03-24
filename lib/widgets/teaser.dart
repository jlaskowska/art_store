import 'package:flutter/material.dart';

class Teaser extends StatelessWidget {
  final String assetPath;
  final String title;
  final String author;

  const Teaser({Key key, @required this.assetPath, @required this.title, @required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            assetPath,
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            author,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
