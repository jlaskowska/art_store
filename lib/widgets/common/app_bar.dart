import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/localizations.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: AppLocalizations.appBarHeadlineArt,
        style: TextStyle(
          fontFamily: 'Arthure',
          color: Colors.black,
          fontSize: 52,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '${AppLocalizations.appBarHeadlineStore}',
            style: TextStyle(
              fontFamily: GoogleFonts.rubik().fontFamily,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      maxLines: 1,
      minFontSize: 20,
    );
  }
}
