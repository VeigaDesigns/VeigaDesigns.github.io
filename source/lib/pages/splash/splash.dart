import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:veiga/pages/home/home.dart';

///Splash Screen
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: EasySplashScreen(
          backgroundImage: const AssetImage("assets/animations/splash.gif"),
          logo: Image.asset(
            "assets/images/empty.png",
          ),
          showLoader: false,
          navigator: const Home(),
          durationInSeconds: 3,
        ),
      ),
    );
  }
}
