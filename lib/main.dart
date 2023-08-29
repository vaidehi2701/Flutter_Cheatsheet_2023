import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_utils/provider/font_size_provider.dart';
import 'package:widget_utils/provider/password_provider.dart';
import 'package:widget_utils/provider/theme_provider.dart';
import 'package:widget_utils/ui/package/showcase.dart';
import 'package:widget_utils/ui/screens/indian_flag_animation.dart';
import 'package:widget_utils/ui/screens/music_list.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontType()),
        ChangeNotifierProvider(create: (_) => PasswordStrengthProvider()),
      ],
      // child: const MyApp(),
      child: const ShowscaseDemo(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//devDiariesWithVee on Instagram
//devDiariesWithVee on Youtube
//vaidehi2701 on Github

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (BuildContext context, themeProvider, widget) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter CheatSheet 2023',
        theme: themeProvider.themeData,
        home: const IndianFlag(),
      );
    });
  }
}
