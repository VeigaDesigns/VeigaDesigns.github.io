import 'package:flutter/material.dart';
import 'package:veiga/pages/about/about.dart';
import 'package:veiga/pages/hireme/hireme.dart';
import 'package:veiga/pages/home/home.dart';
import 'package:veiga/pages/work/work.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:veiga/util/theming/themes.dart';

void main() {
  runApp(
    AdaptiveTheme(
      light: PortfolioThemes.light(),
      dark: PortfolioThemes.dark(),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp(
          initialRoute: "home",
          routes: {
            "home": (context) => const Home(),
            "about": (context) => const AboutMe(),
            "hireme": (context) => const HireMe(),
            "work": (context) => const MyWork(),
          },
        );
      },
    ),
  );
}
