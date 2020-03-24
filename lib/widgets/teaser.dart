import 'package:flutter/material.dart';

class Teaser extends StatelessWidget {
  final String assetPath;
  final String title;
  final String author;
  final Function onTap;

  const Teaser({Key key, @required this.assetPath, @required this.title, @required this.author, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                author,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
