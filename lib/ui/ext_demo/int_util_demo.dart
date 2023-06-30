import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_utils/extensions/int_utils.dart';

class IntUtilDemo extends StatefulWidget {
  const IntUtilDemo({super.key});

  @override
  State<IntUtilDemo> createState() => _IntUtilDemoState();
}

class _IntUtilDemoState extends State<IntUtilDemo> {
  int number = 56743;
  int price = 300;
  int price2 = 2;
  int itemLength = 5;

  @override
  Widget build(BuildContext context) {
    String formattedString = number.toFormattedString();
    String ordinalString = price.toOrdinalString();
    String ordinalString2 = price2.toOrdinalString();

    var style = GoogleFonts.poppins(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Int Extension"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Check its even or not------${number.isEven}",
              style: style,
            ),
            Text(
              "Check its odd or not------${number.isOdd}",
              style: style,
            ),
            Text(
              "Add suffix after number------$ordinalString",
              style: style,
            ),
            Text(
              "Add suffix after number------$ordinalString2",
              style: style,
            ),
            Text(
              "Change to currenency------${price.toCurrencyString(2)}",
              style: style,
            ),
            Text(
              "Format the number------$formattedString",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
