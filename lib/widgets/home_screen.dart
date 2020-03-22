import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/models/product.dart';

import 'package:shopping_cart/services/i_database_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sqliteDatabase = Provider.of<IDatabaseService>(context);
    final newestProducts = sqliteDatabase.getNewestProducts();

    return FutureBuilder(
        future: newestProducts,
        builder: (
          context,
          AsyncSnapshot<List<Product>> snapshot,
        ) {
          if (snapshot.hasData)
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
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
                ),
                Row(
                  children: [
                    for (Product product in snapshot.data)
                      Container(
                        child: Text(product.name),
                      ),
                  ],
                ),
              ],
            );
          else if (snapshot.hasError) {}
        });
  }
}
