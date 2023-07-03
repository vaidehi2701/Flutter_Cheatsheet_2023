import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/provider/font_size_provider.dart';
import 'package:widget_utils/ui/screens/dynamic_fontsize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Utils 2023',
      theme: ThemeData(
        useMaterial3: true,
         textTheme: GoogleFonts.poppinsTextTheme(), 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.blueGrey[100]),
      ),
      home: ChangeNotifierProvider(
        create: (_) => FontType(),
        child: const DynamicFontSize()),
    );
  }
}
