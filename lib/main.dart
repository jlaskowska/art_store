import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:art_store/localizations.dart';
import 'package:art_store/services/i_database_service.dart';
import 'package:art_store/services/sqlite_database_service.dart';
import 'package:art_store/widgets/main_screen.dart';
import 'package:art_store/widgets/shopping_cart_screen/shopping_cart_screen_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sqliteDatabaseService = SQLiteDatabaseService();
  await sqliteDatabaseService.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
    return Provider(
      create: (_) => ShoppingCartScreenStore(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          fontFamily: GoogleFonts.rubik().fontFamily,
        ),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizationsDelegate.supportedLocals,
        home: MainScreen(),
      ),
    );
  }
}
