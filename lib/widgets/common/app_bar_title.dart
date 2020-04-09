import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:art_store/localizations.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;

    return Text.rich(
      TextSpan(
        text: AppLocalizations.appBarHeadlineArt,
        style: TextStyle(
          fontFamily: 'Arthure',
          color: Colors.black,
          fontSize: appBarHeight * 0.85,
        ),
        children: <TextSpan>[
          TextSpan(
            text: AppLocalizations.appBarHeadlineStore,
            style: TextStyle(
              fontFamily: GoogleFonts.rubik().fontFamily,
              fontSize: appBarHeight * 0.30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      maxLines: 1,
    );
  }
}
