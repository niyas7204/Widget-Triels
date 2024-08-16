import 'package:flutter/material.dart';
import 'package:widgettriels/hero/hero_home_page.dart';

class HeroDetails extends StatelessWidget {
  final SuperHero hero;
  const HeroDetails({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: hero,
              child: Image.asset(height: 100, width: 100, hero.image),
            ),
          ],
        ),
      ),
    );
  }
}
