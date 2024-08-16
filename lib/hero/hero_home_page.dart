import 'package:flutter/material.dart';
import 'package:widgettriels/hero/hero_details.dart';

class HeroHomePage extends StatefulWidget {
  const HeroHomePage({super.key});

  @override
  State<HeroHomePage> createState() => _HeroHomePageState();
}

class _HeroHomePageState extends State<HeroHomePage> {
  List<SuperHero> superHeros = [];
  @override
  void initState() {
    for (int i = 0; i < 3; i++) {
      superHeros.add(SuperHero("hero1", "assets/images/profile1.jpg",
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: superHeros.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) =>
                  superHeroCard(context, superHeros[index]),
            ),
          ),
        ),
      )),
    );
  }
}

class SuperHero {
  final String name;
  final String image;
  final String discription;
  SuperHero(this.name, this.image, this.discription);
}

Widget superHeroCard(BuildContext context, SuperHero hero) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HeroDetails(hero: hero),
          ));
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), border: Border.all()),
      height: 80,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Hero(
            tag: hero,
            child: Row(
              children: [
                Image.asset(hero.image),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(hero.name)
        ],
      ),
    ),
  );
}
