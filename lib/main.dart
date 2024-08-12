import 'package:daily_hogwarts/core/widgets/custom_navigation_bar.dart';
import 'package:daily_hogwarts/features/characters/characters_page.dart';
import 'package:daily_hogwarts/features/house/house_page.dart';
import 'package:daily_hogwarts/features/settings/settings_page.dart';
import 'package:daily_hogwarts/features/spells/spells_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Hogwarts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
