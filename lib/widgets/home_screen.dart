import 'package:art_store/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:art_store/models/product.dart';
import 'package:art_store/services/i_database_service.dart';
import 'package:art_store/widgets/common/adaptive_dialog.dart';
import 'package:art_store/widgets/product_detail_screen/product_detail_screen.dart';
import 'package:art_store/widgets/teaser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IDatabaseService databaseService;
  Future<List<Product>> _productFuture;
  bool hasResolvedDependencies = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!hasResolvedDependencies) {
      databaseService = Provider.of<IDatabaseService>(context);
      _productFuture = databaseService.getAllProducts();

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
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
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
        } else if (snapshot.connectionState == ConnectionState.done && (snapshot.hasError || snapshot.data == null)) {
          _showErrorPopup();
          return Container();
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _showErrorPopup() async {
    await Future.delayed(Duration(milliseconds: 1));

    showAdaptiveDialog(
      context: context,
      adaptiveDialog: AdaptiveDialog(
        title: AppLocalizations.adaptiveDialogErrorPopupTitle,
        content: AppLocalizations.adaptiveDialogErrorPopupContent,
        actionLabel: AppLocalizations.adaptiveDialogErrorPopupButtonLabel,
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            _productFuture = databaseService.getAllProducts();
          });
        },
      ),
    );
  }
}
