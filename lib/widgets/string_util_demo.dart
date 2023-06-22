import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_utils/extension/string_utils.dart';

class StringUtilDemo extends StatefulWidget {
  const StringUtilDemo({super.key});

  @override
  State<StringUtilDemo> createState() => _StringUtilDemoState();
}

class _StringUtilDemoState extends State<StringUtilDemo> {
  String name = "devdiariesWithVee";
  String name2 = "Vee";
  String email = "vaidehi2701@gmail.com";

  @override
  Widget build(BuildContext context) {
    var style = GoogleFonts.poppins(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Extension"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: style,
            ),
            Text(name.capitalizeFirstLetter(), style: style),
            Text(name.capitalizeAll(), style: style),
            Text(name.toCamelCase(), style: style),
            Text(name.removeWhitespace(), style: style),
            Text("IsNumeric-------${name.isNumeric()}", style: style),
            Text("limit upto 8 letter-------${name.limit(8)}", style: style),
            Text(
                "Check start with ignore case-----${name.startsWithIgnoreCase(name2)}",
                style: style),
            Text(
                "Check End with ignore case------${name.endsWithIgnoreCase(name2)}",
                style: style),
            Text("Check if its email id or not------${email.isEmail()}",
                style: style),
          ],
        ),
      ),
    );
  }
}
