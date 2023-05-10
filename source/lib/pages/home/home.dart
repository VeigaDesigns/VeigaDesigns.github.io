import 'package:flutter/material.dart';

///Home Page
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              Expanded(
                child: Column(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
