import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/model/settings_view_model.dart';
import 'package:daily_hogwarts/core/router.dart';
import 'package:daily_hogwarts/core/utils/styles.dart';
import 'package:daily_hogwarts/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingsViewModel(),
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
    final SettingsViewModel settingsViewModel =
        context.watch<SettingsViewModel>();
    final ThemeMode themeMode = settingsViewModel.themeMode;
    final String locale = settingsViewModel.locale;

    final AuthViewModel authViewModel = context.watch<AuthViewModel>();
    final Color seedColor = authViewModel.house.color;
    final bool isAuthenticated = authViewModel.isAuthenticated;

    return MaterialApp.router(
      routerConfig: router,
      locale: Locale(locale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: isAuthenticated ? seedColor : Colors.deepPurple,
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
          seedColor: isAuthenticated ? seedColor : Colors.deepPurple,
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
