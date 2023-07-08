import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/provider/theme_provider.dart';

class CustomAppTheme extends StatelessWidget {
  const CustomAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Themes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: "DevDiariesWithVee",
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Sample",
                      )),
                  Container(
                    height: 60,
                    width: 130,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Select Your Custom App Theme Color",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  ColorButton(Colors.blue),
                  ColorButton(Colors.orange),
                  ColorButton(Colors.green),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ColorButton(Colors.red),
                  ColorButton(Colors.brown),
                  ColorButton(Colors.purple),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;

  const ColorButton(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Provider.of<ThemeProvider>(context, listen: false).changeTheme(color);
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset:
                    const Offset(0, 3), // controls the position of the shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
