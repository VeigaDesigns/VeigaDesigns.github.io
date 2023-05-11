import 'package:flutter/material.dart';
import 'package:hoverover/hoverover.dart';
import 'package:veiga/util/data/animation/animate.dart';
import 'package:veiga/util/theming/text.dart';

///Main Menu
class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.sections});

  //Sections
  final Map<String, GlobalKey> sections;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  //Current Selected Option
  int selectedOption = 0;

  //Skew Animation
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: false,
          child: menuItem(0, "NONE", widget.sections["none"]!),
        ),
        menuItem(1, "My Work", widget.sections["my-work"]!),
        menuItem(2, "About Me", widget.sections["about-me"]!),
        menuItem(3, "Hire Me", widget.sections["hire-me"]!),
      ],
    );
  }

  ///Menu Item
  Widget menuItem(
    int index,
    String title,
    GlobalKey section,
  ) {
    //Selection
    bool isSelected = index == selectedOption;

    //Item Width
    double initialWidth = 350.0;
    double expandedWidth = 400.0;
    double currentWidth = initialWidth;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: HoverOver(
        animationDurationInMilliseconds: 100,
        translateXAxis: -14,
        builder: (isHovered) {
          if (isHovered) {
            //currentWidth = expandedWidth;
            _animationController.forward();
          } else {
            //currentWidth = initialWidth;
            _animationController.reverse();
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = index;
                  isSelected = true;
                  currentWidth = expandedWidth;
                });

                //Scroll to Section
                AnimationsController.scrollToSection(section: section);
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform(
                      transform: Matrix4.skewX(isHovered ? -0.2 : 0.0),
                      child: AnimatedContainer(
                        width: currentWidth,
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: ListTile(
                          leading: isHovered || isSelected
                              ? const MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      fontFamily: "KILO",
                                      fontSize: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          title: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              title,
                              style: TextStyles.buttonStyle(),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
