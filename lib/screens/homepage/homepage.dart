import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FaIcon(FontAwesomeIcons.burger),
          FaIcon(FontAwesomeIcons.clockRotateLeft),
          FaIcon(FontAwesomeIcons.heart),
          FaIcon(FontAwesomeIcons.basketShopping),
        ],
      ),
    );
  }
}
