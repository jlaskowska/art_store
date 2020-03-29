import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/services/i_database_service.dart';
import 'package:shopping_cart/services/sqlite_database_service.dart';
import 'package:shopping_cart/widgets/main_screen.dart';

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
    return MaterialApp(
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
        // scaffoldBackgroundColor: Colors.white,
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
    );
  }
}
