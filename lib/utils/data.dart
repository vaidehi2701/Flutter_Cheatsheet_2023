import 'package:flutter/material.dart';

const selectedColor = Color.fromARGB(255, 231, 63, 63);
const unselectedColor = Color(0xff5f6368);
final tabs = [
  const Tab(text: 'Home'),
  const Tab(text: 'Search'),
  const Tab(text: 'Settings'),
];

final iconTabs = [
  const Tab(icon: Icon(Icons.home)),
  const Tab(icon: Icon(Icons.search)),
  const Tab(icon: Icon(Icons.settings)),
];

final imageTabs = [
  Tab(
      icon: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset("assets/icons/services.gif"),
  )),
  Tab(
      icon: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      "assets/icons/insta.gif",
    ),
  )),
  Tab(
      icon: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset("assets/icons/linkedin.gif"),
  )),
  
];

final secondTabs = [
  const Tab(text: 'Like'),
  const Tab(text: 'Follow'),
  const Tab(text: 'Share'),
];

final iconTextTabs = [
  const Tab(icon: Icon(Icons.home), text: "Home"),
  const Tab(
    icon: Icon(Icons.search),
    text: "Search",
  ),
  const Tab(
    icon: Icon(Icons.settings),
    text: "Settings",
  ),
];
