import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widgettriels/beat_animation/beat_home.dart';
import 'package:widgettriels/card_slider/card_slider.dart';
import 'package:widgettriels/customClipPath/clippath.dart';
import 'package:widgettriels/google_map/google_map_home.dart';
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
      home: GoogleMapHomePage(),
    );
  }
}
