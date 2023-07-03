import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/utils/font_size_helper.dart';
import 'package:widget_utils/provider/font_size_provider.dart';

//DynamicFontSize
class DynamicFontSize extends StatefulWidget {
  const DynamicFontSize({super.key});

  @override
  State<DynamicFontSize> createState() => _DynamicFontSizeState();
}

class _DynamicFontSizeState extends State<DynamicFontSize> {
  @override
  Widget build(BuildContext context) {
    final fontType = Provider.of<FontType>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Size Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFontSizeDialog(context, fontType);
        },
        child: const Icon(Icons.format_size),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextHandler(
                'Follow Now! 🚀',
                TextStyle(
                  fontSize: 14,
                )),
            SizedBox(height: 20),
            TextHandler('DevDiariesWithVee',
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _showFontSizeDialog(BuildContext context, FontType fontType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Font Size'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: FontTypeValue.values.map<Widget>((FontTypeValue value) {
              return RadioListTile<FontTypeValue>(
                title: Text(value.toString().split('.').last),
                value: value,
                groupValue: fontType.value,
                onChanged: (FontTypeValue? newValue) {
                  fontType.value = newValue!;
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
