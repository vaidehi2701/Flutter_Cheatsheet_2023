import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaroid_carousel/polaroid_carousel.dart';

class PolariodPhoto extends StatelessWidget {
  const PolariodPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Image.asset(
        "assets/images/chandler/c1.jpg",
      ),
      Image.asset("assets/images/chandler/c2.jpg"),
      Image.asset("assets/images/chandler/c3.jpg"),
      Image.asset(
        "assets/images/chandler/c4.jpg",
        height: 200,
        fit: BoxFit.cover,
      ),
      Image.asset("assets/images/chandler/c5.jpg"),
      Image.asset("assets/images/chandler/c6.jpg"),
      Image.asset("assets/images/chandler/c7.jpg"),
      Image.asset(
        "assets/images/chandler/c8.jpg",
      ),
      Image.asset(
        "assets/images/chandler/c9.jpeg",
      ),
    ];

    return Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PolaroidCarousel(
                  //these to property are necessary

                  // value to which list item translate
                  // advice : if the children are rotated like the example and you are not able to specify the translateFactor
                  // then the max translateFactor should be √((childHeight^2, childWidth^2)) of child with maximum size
                  //but try to adjust translateFactor according to your need
                  translateFactor: 360,

                  // these properties are optional

                  // duration: const Duration(seconds: 1),
                  rotate: const Rotate(x: 0.001, y: 0.02, z: 0.001),
                  // curve: Curves.easeInOut,
                  //order: Order.frontToBack,

                  children: list,
                  // translate: Translate.top,
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'We Will Miss You Chandler Bing !!!',
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.poppins(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                )
              ]),
        ));
  }
}
