import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savings_number_cruncher/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color darkAccentColour = Color(0xFF00D9F6);
    final Color darkScaffoldColour = Color(0xFF111111);
    final Color darkCardColour = Color(0xFF1a2133);

    return MaterialApp(
      title: 'Savings Number Cruncher',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
//        primaryColor: Color(0xFF006600),
//        accentColor: Color(0xFF004400),
        accentColor: Color(0xFF00D9F6),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
//        primaryColor: Color(0xFF006600),
//        accentColor: Color(0xFF004400),
        accentColor: darkAccentColour,
        scaffoldBackgroundColor: darkScaffoldColour,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white),
          button: TextStyle(color: Colors.white),
          overline: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          color: darkScaffoldColour,
          elevation: 0.0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: darkCardColour,
          elevation: 0.0,
          shadowColor: darkAccentColour,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
      home: HomeScreen(title: 'Savings Number Cruncher'),
    );
  }
}
