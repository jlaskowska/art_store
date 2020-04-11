import 'package:flutter/material.dart';

class Teaser extends StatelessWidget {
  static const _borderRadius = 10.0;
  static const _padding = 8.0;

  final String assetPath;
  final String title;
  final String author;
  final Function onTap;
  final int id;

  const Teaser({
    Key key,
    @required this.assetPath,
    @required this.title,
    @required this.author,
    @required this.onTap,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                topRight: Radius.circular(_borderRadius),
              ),
              child: Hero(
                tag: id,
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: _padding, bottom: 4, left: _padding),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: _padding, left: _padding),
              child: Text(
                author,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
