import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Festival extends StatefulWidget {
  const Festival({super.key});

  @override
  _FestivalState createState() => _FestivalState();
}

class _FestivalState extends State<Festival> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();

    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawFlower(Size size) {
    double degreeToRadian(double degree) {
      return degree * (pi / 180);
    }

    final center = Offset(size.width / 2, size.height / 2);
    final petalRadius = size.width / 4;
    final petalLength = petalRadius * 2;
    final petalWidth = petalRadius / 2;
    final path = Path();

    const petalCount = 6;
    const petalAngle = 360 / petalCount;

    for (var i = 0; i < petalCount; i++) {
      final angle = degreeToRadian(petalAngle * i);
      final xPoint = center.dx + cos(angle) * petalLength;
      final yPoint = center.dy + sin(angle) * petalLength;
      final controlX1 = center.dx + cos(angle + pi / 6) * petalWidth;
      final controlY1 = center.dy + sin(angle + pi / 6) * petalWidth;
      final controlX2 = center.dx + cos(angle - pi / 6) * petalWidth;
      final controlY2 = center.dy + sin(angle - pi / 6) * petalWidth;

      if (i == 0) {
        path.moveTo(center.dx, center.dy);
      } else {
        path.lineTo(xPoint, yPoint);
      }

      path.cubicTo(
        controlX1,
        controlY1,
        controlX2,
        controlY2,
        xPoint,
        yPoint,
      );

      path.quadraticBezierTo(
        center.dx + petalWidth / 2,
        center.dy + petalWidth / 2,
        center.dx,
        center.dy,
      );
    }

    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          //CENTER -- Blast
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.yellow,
                Colors.yellowAccent,
                Colors.orangeAccent,
                Colors.deepOrange,
              ], // manually specify the colors to be used
              createParticlePath: drawFlower, // define a custom shape/path.
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Lottie.asset('assets/gif/ganesha.json')),
        ],
      ),
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
