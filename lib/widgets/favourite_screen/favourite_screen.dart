import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/services/i_database_service.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Future<List<Product>> _favouriteProductsFuture;
  int _index = 0;
  bool hasResolvedDependencies = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!hasResolvedDependencies) {
      final sqliteDatabase = Provider.of<IDatabaseService>(context);
      _favouriteProductsFuture = sqliteDatabase.getAllProducts();

      hasResolvedDependencies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _favouriteProductsFuture,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: SizedBox(
                  height: constraints.maxHeight * 0.8,
                  child: PageView.builder(
                    itemCount: snapshot.data.length,
                    controller: PageController(viewportFraction: 0.8),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              snapshot.data[i].assetPath,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {}
        return CircularProgressIndicator();
      },
    );
  }
}
