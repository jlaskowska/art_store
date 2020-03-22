import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'New Work',
            style: TextStyle(
              fontFamily: GoogleFonts.fingerPaint().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
