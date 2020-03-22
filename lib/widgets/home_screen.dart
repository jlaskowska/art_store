import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
          child: Text(
            AppLocalizations.homeScreenHeadlineNewWork,
            style: TextStyle(
              fontFamily: GoogleFonts.fingerPaint().fontFamily,
              fontSize: 40,
            ),
          ),
        ),
        Row(),
      ],
    );
  }
}
