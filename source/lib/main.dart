import 'package:flutter/material.dart';
import 'package:veiga/pages/about/about.dart';
import 'package:veiga/pages/hireme/hireme.dart';
import 'package:veiga/pages/home/home.dart';
import 'package:veiga/pages/splash/splash.dart';
import 'package:veiga/pages/work/work.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:veiga/util/theming/themes.dart';

void main() async {
  //Ensure Widgets Binding is Initialized
  WidgetsFlutterBinding.ensureInitialized();

  //Run App
  runApp(
    AdaptiveTheme(
      light: PortfolioThemes.light(),
      dark: PortfolioThemes.dark(),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp(
          theme: light,
          darkTheme: dark,
          themeMode: ThemeMode.light,
          initialRoute: "splash",
          routes: {
            "splash": (context) => const Splash(),
            "home": (context) => const Home(),
          },
        );
      },
    ),
  );
}
