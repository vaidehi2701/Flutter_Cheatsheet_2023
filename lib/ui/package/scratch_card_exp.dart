import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScratchCardExample extends StatefulWidget {
  const ScratchCardExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScratchCardExampleState createState() => _ScratchCardExampleState();
}

class _ScratchCardExampleState extends State<ScratchCardExample> {
  ConfettiController _controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.5),
      body: Center(
        child: Scratcher(
          brushSize: 50,
          threshold: 75,
          color: Colors.transparent,
          image: Image.asset(
            "assets/images/outer.png",
            fit: BoxFit.fill,
          ),
          onThreshold: () => _controller.play(),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ConfettiWidget(
                      blastDirectionality: BlastDirectionality.explosive,
                      confettiController: _controller,
                      particleDrag: 0.05,
                      emissionFrequency: 0.05,
                      numberOfParticles: 50,
                      gravity: 0.05,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.red,
                        Colors.yellow,
                        Colors.blue,
                      ],
                    ),
                    Image.asset(
                      "assets/images/inner.png",
                      fit: BoxFit.fill,
                      width: 300,
                      height: 300,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
