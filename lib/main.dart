import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/model/theme_view_model.dart';
import 'package:daily_hogwarts/core/router.dart';
import 'package:daily_hogwarts/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = context.watch<ThemeViewModel>().themeMode;

    return MaterialApp.router(
      routerConfig: router,
      title: 'Daily Hogwarts',
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.lexendTextTheme(
          Theme.of(context).textTheme.apply(
                displayColor: Colors.black,
                bodyColor: Colors.black,
              ),
        ), // TextTheme(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: navLabelTextStyle,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.lexendTextTheme(
          Theme.of(context).textTheme.apply(
                displayColor: Colors.white,
                bodyColor: Colors.white,
              ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: navLabelTextStyle,
        ),
      ),
    );
  }
}
