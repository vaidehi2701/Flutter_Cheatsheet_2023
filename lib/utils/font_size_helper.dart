import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/provider/font_size_provider.dart';

class TextHandler extends StatelessWidget {
  final String text;
  final TextStyle style;

  const TextHandler(this.text, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    final fontType = Provider.of<FontType>(context);

    return Text(
      text,
      style: style.copyWith(fontSize: _getFontSize(fontType.value)),
    );
  }

  double _getFontSize(FontTypeValue value) {
    switch (value) {
      case FontTypeValue.small:
        return style.fontSize! - 5;
      case FontTypeValue.medium:
        return style.fontSize!;
      case FontTypeValue.large:
        return style.fontSize! + 5;
    }
  }
}