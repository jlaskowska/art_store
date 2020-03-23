import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/localizations.dart';

class HomeScreenHeadline extends StatelessWidget {
  const HomeScreenHeadline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 16.0,
      ),
      child: Text(
        AppLocalizations.homeScreenHeadlineNewWork,
        style: TextStyle(
          fontFamily: GoogleFonts.fingerPaint().fontFamily,
          fontSize: 24,
        ),
      ),
    );
  }
}
