import 'package:flutter/material.dart';

class ImageSizeAnimation extends StatefulWidget {
  const ImageSizeAnimation({super.key});

  @override
  _ImageSizeAnimationState createState() => _ImageSizeAnimationState();
}

class _ImageSizeAnimationState extends State<ImageSizeAnimation>
    with SingleTickerProviderStateMixin {
  double imageSize = 100.0;
  AnimationController? _controller;
  int selectedButtonIndex = 0;
  double buttonSize = 45;
  Color btnColor = Colors.white;
  String price = "15.20";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void animateToSize(double size) {
    _controller!.reset();
    _controller!.forward();
    setState(() {
      imageSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const SetAppbar(),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text("Bacon Burger",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 45,
            ),
            const Center(
              child: Text(
                "A Signature flame-grill beaf patty\ntopped with smoked bacon.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  child: Center(
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/burger.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      duration: const Duration(milliseconds: 500),
                      width: imageSize,
                      height: imageSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedSquareButton(
                    text: "S",
                    size: selectedButtonIndex == 0 ? 55 : buttonSize,
                    color: selectedButtonIndex == 0 ? Colors.yellow : btnColor,
                    onPressed: () {
                      animateToSize(100.0);
                      selectedButtonIndex = 0;
                      price = "15.20";
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 8.0),
                  RoundedSquareButton(
                      text: "M",
                      size: selectedButtonIndex == 1 ? 55 : buttonSize,
                      color:
                          selectedButtonIndex == 1 ? Colors.yellow : btnColor,
                      onPressed: () {
                        animateToSize(150.0);
                        selectedButtonIndex = 1;
                        price = "25.30";
                        setState(() {});
                      }),
                  const SizedBox(width: 8.0),
                  RoundedSquareButton(
                      text: "L",
                      size: selectedButtonIndex == 2 ? 55 : buttonSize,
                      color:
                          selectedButtonIndex == 2 ? Colors.yellow : btnColor,
                      onPressed: () {
                        animateToSize(200.0);
                        selectedButtonIndex = 2;
                        price = "35.10";
                        setState(() {});
                      }),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Text("Price",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            Text(
              "\$$price",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Text(
                  "Buy now",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedSquareButton extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onPressed;
  final Color color;

  const RoundedSquareButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class SetAppbar extends StatelessWidget {
  const SetAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 27.0,
            ),
          ),
        ),
        const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
          size: 35,
        ),
      ],
    );
  }
}
