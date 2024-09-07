import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/model/theme_view_model.dart';
import 'package:daily_hogwarts/core/ui/custom_navigation_bar.dart';
import 'package:daily_hogwarts/core/utils/styles.dart';
import 'package:daily_hogwarts/features/characters/characters_page.dart';
import 'package:daily_hogwarts/features/house/house_page.dart';
import 'package:daily_hogwarts/features/settings/settings_page.dart';
import 'package:daily_hogwarts/features/spells/spells_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
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
    final Color seedColor = context.read<AuthViewModel>().house.color;

    return MaterialApp(
      title: 'Daily Hogwarts',
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
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
          seedColor: seedColor,
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
      home: const MainContainer(),
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;
  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      HousePage(),
      SpellsPage(),
      CharactersPage(),
      SettingsPage(),
    ];

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: _selectedIndex,
      ),
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
    );
  }
}
