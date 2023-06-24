import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlidersPage extends StatelessWidget {
  const CustomSlidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSlider("Default iOS Slider", const IosSlider()),
                  _buildSlider(
                      "Default Material Slider", const _SimpleSlider()),
                  _buildSlider(
                      "Custom Colors",
                      const _SimpleSlider(
                          thumbColor: Colors.redAccent,
                          activeColor: Colors.deepPurpleAccent,
                          inactiveColor: Colors.grey)),
                  _buildSlider("Default Slider with divisions",
                      const _SimpleSlider(divisions: 5)),
                  _buildSlider(
                      "Paddle Thumb Overlay",
                      const CustomThumbShape(
                          valueIndicatorShape:
                              PaddleSliderValueIndicatorShape())),
                  _buildSlider(
                      "Rectangular Thumb Overlay",
                      const CustomThumbShape(
                          valueIndicatorShape:
                              RectangularSliderValueIndicatorShape())),
                  _buildSlider("Poligon Slider Thumb ", const PolygonSlider()),
                  _buildSlider(
                      "Range Slider",
                      RangeSliderExample(
                        activeColor: Colors.deepPurpleAccent,
                        inactiveColor: Colors.purpleAccent,
                        startValue: 20.0,
                        endValue: 90.0,
                      )),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String title, Widget child) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Text(title), child, const Divider()]),
    );
  }
}

class _SimpleSlider extends StatefulWidget {
  final Color? thumbColor, activeColor, inactiveColor;
  final int? divisions;

  const _SimpleSlider(
      {Key? key,
      this.thumbColor,
      this.activeColor,
      this.inactiveColor,
      this.divisions})
      : super(key: key);

  @override
  __SimpleSliderState createState() => __SimpleSliderState();
}

class __SimpleSliderState extends State<_SimpleSlider> {
  double _currentSliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.toInt().toString(),
      thumbColor: widget.thumbColor,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      divisions: widget.divisions,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class IosSlider extends StatefulWidget {
  const IosSlider({super.key});

  @override
  State<IosSlider> createState() => _IosSliderState();
}

class _IosSliderState extends State<IosSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

// ignore: must_be_immutable
class RangeSliderExample extends StatefulWidget {
  final Color activeColor, inactiveColor;
  double startValue, endValue;
  RangeSliderExample(
      {super.key,
      required this.activeColor,
      required this.inactiveColor,
      required this.startValue,
      required this.endValue});

  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0.0,
      max: 100.0,
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      values: RangeValues(widget.startValue, widget.endValue),
      onChanged: (values) {
        setState(() {
          widget.startValue = values.start;
          widget.endValue = values.end;
        });
      },
    );
  }
}

class CustomThumbShape extends StatelessWidget {
  final SliderComponentShape valueIndicatorShape;
  const CustomThumbShape({Key? key, required this.valueIndicatorShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context)
            .copyWith(valueIndicatorShape: valueIndicatorShape),
        child: const _SimpleSlider(divisions: 100));
  }
}

class PolygonSlider extends StatefulWidget {
  const PolygonSlider({super.key});

  @override
  State<PolygonSlider> createState() => _PolygonSliderState();
}

class _PolygonSliderState extends State<PolygonSlider> {
  double _currentSliderValue = 10.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: PolygonSliderThumb(),
      ),
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        onChanged: (newValue) {
          setState(() {
            _currentSliderValue = newValue;
          });
        },
      ),
    );
  }
}

class PolygonSliderThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // Define the preferred size of the thumb here
    return const Size(30, 30); // Customize the size as needed
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    // Define the polygon shape for the slider thumb here
    final canvas = context.canvas;
    final thumbRadius = getPreferredSize(true, isDiscrete).width / 2;

    final path = Path();
    path.moveTo(
        center.dx + thumbRadius * cos(0), center.dy + thumbRadius * sin(0));
    for (int i = 1; i <= 6; i++) {
      final angle = i * 2 * pi / 6;
      final x = center.dx + thumbRadius * cos(angle);
      final y = center.dy + thumbRadius * sin(angle);
      path.lineTo(x, y);
    }
    path.close();

    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }
}
