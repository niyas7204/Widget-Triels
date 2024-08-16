import 'package:flutter/material.dart';

class BeatHome extends StatefulWidget {
  const BeatHome({super.key});

  @override
  State<BeatHome> createState() => _BeatHomeState();
}

class _BeatHomeState extends State<BeatHome>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: animationController, curve: Curves.decelerate),
    );

    animationController.forward();
    animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
            scale: animation,
            child: Image.asset(height: 150, "assets/images/profile1.jpg")),
      ),
    );
  }
}
