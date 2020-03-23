import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/models/product.dart';

import 'package:shopping_cart/services/i_database_service.dart';
import 'package:shopping_cart/widgets/teaser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Product>> _productFuture;
  bool hasResolvedDependencies = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!hasResolvedDependencies) {
      final sqliteDatabase = Provider.of<IDatabaseService>(context);
      _productFuture = sqliteDatabase.getNewestProducts();

      hasResolvedDependencies = true;
    }
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    //

    return FutureBuilder(
        future: _productFuture,
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
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: snapshot.data.length,
                    controller: PageController(viewportFraction: 0.4),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Teaser(assetPath: snapshot.data[i].assetPath),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          else if (snapshot.hasError) {}

          return Container();
        });
  }
}
