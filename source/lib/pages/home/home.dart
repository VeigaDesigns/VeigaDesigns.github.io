import 'package:flutter/material.dart';
import 'package:veiga/pages/home/widgets/menu.dart';
import 'package:veiga/pages/work/work.dart';
import 'package:veiga/util/data/animation/animate.dart';

///Home Page
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //Logo Breathing
  late AnimationController _logoBreathingController;
  late Animation<double> _breathingOpacityAnimation;

  //Scroll Controller
  late ScrollController _scrollController;

  //Section Keys
  Map<String, GlobalKey> sectionKeys = {};

  //Generate Keys
  void generateSectionKeys({required List<String> sections}) {
    for (String section in sections) {
      sectionKeys[section] = GlobalKey();
    }
  }

  @override
  void initState() {
    super.initState();

    //Generate Section Keys
    generateSectionKeys(
      sections: [
        "none",
        "home",
        "my-work",
        "about-me",
        "hire-me",
      ],
    );

    //Scroll Controller
    _scrollController = ScrollController();

    //Logo Breathing
    _logoBreathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    //Opacity Animation
    _breathingOpacityAnimation = CurvedAnimation(
      parent: _logoBreathingController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();

    //Dispose Scroll Controller
    _scrollController.dispose();

    //Dispose Animation Controller
    _logoBreathingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              //Home Landing
              AnimatedBuilder(
                key: sectionKeys["home"],
                animation: _breathingOpacityAnimation,
                builder: (context, child) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          "assets/images/logo_full.png",
                        ),
                        fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high,
                        opacity: 0.2 + (_breathingOpacityAnimation.value * 0.2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimationsController.asset(
                              animation: "head",
                              repeat: true,
                            ),
                          ),
                          Expanded(
                            child: MainMenu(
                              sections: sectionKeys,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              //My Work
              MyWork(
                sections: sectionKeys,
                previousSection: sectionKeys["home"],
                key: sectionKeys["my-work"],
                nextSection: sectionKeys["about-me"],
              ),
              Container(
                key: sectionKeys["about-me"],
                height: 800.0,
                color: Colors.yellow,
              ),
              Container(
                key: sectionKeys["hire-me"],
                height: 800.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
