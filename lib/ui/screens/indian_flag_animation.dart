import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndianFlag extends StatefulWidget {
  const IndianFlag({super.key});

  @override
  State<IndianFlag> createState() => _IndianFlagState();
}

class _IndianFlagState extends State<IndianFlag> {
  double turnValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      turnValue = 20;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4)),
              child: AnimatedRotation(
                turns: turnValue,
                duration: const Duration(seconds: 10),
                child: Stack(
                    children: List.generate(13, (index) {
                  return Center(
                    child: Transform.rotate(
                      angle: index * 0.26,
                      child: Container(
                        height: 4,
                        width: 100,
                        color: Colors.blue,
                      ),
                    ),
                  );
                })),
              ),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          ),
          const SizedBox(height: 100),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Happy Independenc Day !!!',
                textStyle: GoogleFonts.poppins(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                speed: const Duration(milliseconds: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
