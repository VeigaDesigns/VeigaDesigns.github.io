import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

///Animation Controller
class AnimationsController {
  ///Asset Animation
  static LottieBuilder asset({
    required String animation,
    required bool repeat,
    double? height,
  }) {
    return Lottie.asset(
      "assets/animations/lottie/$animation.json",
      height: height,
      repeat: repeat,
      animate: true,
      frameRate: FrameRate.max,
      filterQuality: FilterQuality.high,
    );
  }

  //Scroll to Section
  static void scrollToSection({
    required Key? section,
  }) {
    //Section
    final BuildContext? renderObject = (section as GlobalKey).currentContext;

    //Check if Section Exists
    if (renderObject != null) {
      Scrollable.ensureVisible(
        renderObject,
        alignment: 0.4,
        duration: const Duration(milliseconds: 400),
      );
    }
  }
}
