import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shopping_cart/models/product.dart';

import 'package:shopping_cart/services/i_database_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart/widgets/product_detail_screen/product_detail_screen.dart';
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
      _productFuture = sqliteDatabase.getAllProducts();

      hasResolvedDependencies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _productFuture,
        builder: (
          context,
          AsyncSnapshot<List<Product>> snapshot,
        ) {
          if (snapshot.hasData)
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => Teaser(
                id: snapshot.data[index].id,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ProductDetailScreen(product: snapshot.data[index]),
                  ),
                ),
                title: snapshot.data[index].name,
                author: snapshot.data[index].author,
                assetPath: snapshot.data[index].assetPath,
              ),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          else if (snapshot.hasError) {}

          return CircularProgressIndicator();
        });
  }
}
