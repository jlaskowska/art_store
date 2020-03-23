import 'package:flutter/material.dart';

class Teaser extends StatelessWidget {
  final String assetPath;

  const Teaser({Key key, @required this.assetPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
