import 'package:flutter/material.dart';
import 'package:widgettriels/beat_animation/beat_home.dart';
import 'package:widgettriels/hero/hero_details.dart';
import 'package:widgettriels/hero/hero_home_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BeatHome(),
    );
  }
}
