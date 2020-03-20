import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/services/i_database_service.dart';
import 'package:shopping_cart/services/sqlite_database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sqliteDatabaseService = SQLiteDatabaseService();
  await sqliteDatabaseService.initialize();

  runApp(
    Provider<IDatabaseService>.value(
      value: sqliteDatabaseService,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizationsDelegate.supportedLocals,
      home: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppLocalizations.of(context).appTitle),
      ),
    );
  }
}
