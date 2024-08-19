import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPaths extends StatefulWidget {
  const CustomPaths({super.key});

  @override
  State<CustomPaths> createState() => _CustomPathsState();
}

class _CustomPathsState extends State<CustomPaths> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: BackgrongClipper(),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) => ExpandedContainer(),
                  ));
            },
            child: Hero(
              tag: 'background',
              child: Container(
                height: size.height * .8,
                width: size.width * .3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange, Colors.deepOrangeAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgrongClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * .33);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, 50, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width, 0, size.width - 150, 100);
    path.lineTo(50, size.height * .33 + 10);
    path.quadraticBezierTo(
        0, size.height * .33 + 50, 0, size.height * .33 + 100);
    // TODO: implement getClip
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class ExpandedContainer extends StatefulWidget {
  const ExpandedContainer({super.key});

  @override
  State<ExpandedContainer> createState() => _ExpandedContainerState();
}

class _ExpandedContainerState extends State<ExpandedContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'background',
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrangeAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
        ),
      ),
    );
  }
}
