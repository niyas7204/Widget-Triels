import 'dart:math';
import 'dart:developer' as console;
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({super.key});

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double rotationFactor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, .001)
                  ..rotateY(
                    pi * rotationFactor,
                  ),
                origin: Offset(150, 0),
                child: rotationFactor < .5 ? CardFrontView() : CardBackView()),
            SizedBox(
              width: 300,
              child: Slider(
                value: rotationFactor,
                onChanged: (value) {
                  console.log("new value =$value");
                  setState(() {
                    rotationFactor = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardFrontView extends StatelessWidget {
  const CardFrontView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.orange, Colors.deepOrangeAccent]),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}

class CardBackView extends StatelessWidget {
  const CardBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 223, 240, 224)]),
              borderRadius: BorderRadius.circular(12)),
        ),
      ],
    );
  }
}
