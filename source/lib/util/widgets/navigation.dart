import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:veiga/util/data/animation/animate.dart';

///Navigation
class NavigationSection extends StatefulWidget {
  const NavigationSection({
    super.key,
    required this.sections,
    required this.previous,
    required this.next,
  });

  //Parameters
  final Map<String, GlobalKey> sections;
  final Key? previous;
  final Key? next;

  @override
  State<NavigationSection> createState() => _NavigationSectionState();
}

class _NavigationSectionState extends State<NavigationSection> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.0,
      right: 40.0,
      child: Column(
        children: [
          Visibility(
            visible: widget.previous != widget.sections["home"],
            child: IconButton(
              color: Theme.of(context).colorScheme.primary,
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              icon: const Icon(Ionicons.chevron_up),
              onPressed: () {
                AnimationsController.scrollToSection(
                  section: widget.previous,
                );
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            icon: const Icon(Ionicons.chevron_down),
            onPressed: () {
              AnimationsController.scrollToSection(
                section: widget.next,
              );
            },
          ),
        ],
      ),
    );
  }
}
