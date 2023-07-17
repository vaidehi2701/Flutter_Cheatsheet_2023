import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvanceStepper extends StatefulWidget {
  const AdvanceStepper({Key? key}) : super(key: key);

  @override
  State<AdvanceStepper> createState() => _AdvanceStepperState();
}

class _AdvanceStepperState extends State<AdvanceStepper> {
  int activeStep = 0;
  int activeStep2 = 0;
  int activeStepForThird = 0;
  int activeStep2ForThird = 0;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              firstStepper(),
              const SizedBox(height: 20),
              secondStepper(),
              const SizedBox(height: 40),
              thirdStepper()
            ],
          ),
        ),
      ),
    );
  }

  Widget firstStepper() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EasyStepper(
          activeStep: activeStep,
          lineLength: 50,
          stepShape: StepShape.rRectangle,
          stepBorderRadius: 15,
          borderThickness: 2,
          internalPadding: 10,
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 30, vertical: 20),
          stepRadius: 28,
          finishedStepBorderColor: Colors.deepOrange,
          finishedStepTextColor: Colors.deepOrange,
          finishedStepBackgroundColor: Colors.deepOrange,
          activeStepIconColor: Colors.deepOrange,
          showLoadingAnimation: false,
          showScrollbar: false,
          steps: [
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 0 ? 1 : 0.3,
                  child: Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              customTitle: const Text(
                'Step 1',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 1 ? 1 : 0.3,
                  child: Image.asset(
                    'assets/images/2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              customTitle: const Text(
                'Step 2',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 2 ? 1 : 0.3,
                  child: Image.asset('assets/images/3.jpg'),
                ),
              ),
              customTitle: const Text(
                'Step 3',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 3 ? 1 : 0.3,
                  child: Image.asset('assets/images/4.jpg'),
                ),
              ),
              customTitle: const Text(
                'Step 4',
                textAlign: TextAlign.center,
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 4 ? 1 : 0.3,
                  child: Image.asset('assets/images/5.jpg'),
                ),
              ),
              customTitle: const Text(
                'Step 5',
                textAlign: TextAlign.center,
              ),
            ),
          ],
          onStepReached: (index) => setState(() => activeStep = index),
        ),
        const SizedBox(height: 5),
        Text(
          'Currently On Step ${activeStep + 1}',
          style: GoogleFonts.alike(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget secondStepper() {
    return Container(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 20),
      child: EasyStepper(
        activeStep: activeStep,
        lineLength: 50,
        lineSpace: 0,
        disableScroll: true,
        lineType: LineType.normal,
        defaultLineColor: Colors.white,
        finishedLineColor: Colors.orange,
        activeStepTextColor: Colors.black87,
        finishedStepTextColor: Colors.black87,
        internalPadding: 10,
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 20),
        showLoadingAnimation: false,
        stepRadius: 8,
        showStepBorder: false,
        lineThickness: 1.5,
        steps: [
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 0 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Pending',
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 1 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Waiting',
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 2 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Order Received',
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 3 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Preparing',
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 4 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'On Way',
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 5 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Delivered',
            topTitle: true,
          ),
        ],
        onStepReached: (index) => setState(() => activeStep = index),
      ),
    );
  }

  Widget thirdStepper() {
    return EasyStepper(
      lineType: LineType.dotted,
      activeStep: activeStepForThird,
      direction: Axis.vertical,
      unreachedStepIconColor: Colors.white,
      unreachedStepBorderColor: Colors.black54,
      finishedStepBackgroundColor: Colors.deepPurple,
      unreachedStepBackgroundColor: Colors.deepOrange,
      finishedStepTextColor: Colors.black,
      showTitle: true,
      lineLength: 40,
      lineThickness: 2,
      internalPadding: 60,
      onStepReached: (index) => setState(() => activeStepForThird = index),
      steps: const [
        EasyStep(
          icon: Icon(CupertinoIcons.cart),
          title: 'Cart',
          activeIcon: Icon(CupertinoIcons.cart),
          lineText: 'Cart Line',
        ),
        EasyStep(
          icon: Icon(Icons.file_present),
          activeIcon: Icon(Icons.file_present),
          title: 'Address',
        ),
        EasyStep(
          icon: Icon(Icons.filter_center_focus_sharp),
          activeIcon: Icon(Icons.filter_center_focus_sharp),
          title: 'Checkout',
        ),
        EasyStep(
          icon: Icon(Icons.money),
          activeIcon: Icon(Icons.money),
          title: 'Waiting for payment',
        ),
        EasyStep(
          icon: Icon(Icons.local_shipping_outlined),
          activeIcon: Icon(Icons.local_shipping_outlined),
          title: 'Shipping',
        ),
        EasyStep(
          icon: Icon(Icons.check_circle_outline),
          activeIcon: Icon(Icons.check_circle_outline),
          title: 'Finish',
        ),
      ],
    );
  }
}
