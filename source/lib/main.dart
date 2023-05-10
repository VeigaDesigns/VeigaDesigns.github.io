import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:veiga/pages/about/about.dart';
import 'package:veiga/pages/hireme/hireme.dart';
import 'package:veiga/pages/home/home.dart';
import 'package:veiga/pages/work/work.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:veiga/util/data/local/storage.dart';
import 'package:veiga/util/data/spotify/handler.dart';
import 'package:veiga/util/theming/themes.dart';

void main() async {
  //Load Environment Variables
  await dotenv.load(fileName: ".env");

  //Spotify - According to Platform
  if (kIsWeb) {
    //Access Token
    final accessToken = await SpotifyHandler.accessToken();

    //Store Locally
    LocalStorage.saveData(
      box: "spotify",
      data: {
        "access_token": accessToken,
      },
    );
  } else {
    //Connect to Spotify
    await SpotifyHandler.authenticate();
  }

  //Run App
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
