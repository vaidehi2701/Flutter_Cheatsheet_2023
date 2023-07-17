import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_utils/ui/extra/advance_stepper.dart';
import 'package:widget_utils/ui/extra/basic_stepper.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BasicStepper()));
              },
              child: Text(
                "Basic Stepper",
                style: GoogleFonts.poppins(fontSize: 18),
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdvanceStepper()));
              },
              child: Text("Advance Stepper",
                  style: GoogleFonts.poppins(fontSize: 18)))
        ],
      ),
    );
  }
}
