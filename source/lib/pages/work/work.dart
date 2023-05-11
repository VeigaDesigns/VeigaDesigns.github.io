import 'package:flutter/material.dart';
import 'package:veiga/util/widgets/navigation.dart';

///Work
class MyWork extends StatefulWidget {
  const MyWork({
    super.key,
    required this.sections,
    required this.previousSection,
    required this.nextSection,
  });

  //Parameters
  final Map<String, GlobalKey> sections;
  final Key? previousSection;
  final Key? nextSection;

  @override
  State<MyWork> createState() => _MyWorkState();
}

class _MyWorkState extends State<MyWork> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            NavigationSection(
              sections: widget.sections,
              previous: widget.previousSection,
              next: widget.nextSection,
            ),
          ],
        ),
      ),
    );
  }
}
