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

 final navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.access_alarm_outlined),
      activeIcon: Icon(Icons.access_alarm_rounded),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_rounded),
      activeIcon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

  class Model {
  final String id;
  final String name;

  Model({required this.id, required this.name});
}


List<Model> models = [
  Model(id: '12', name: 'Vaidehi'),
  Model(id: '34', name: 'John'),
  Model(id: '56', name: 'Emily'),
  // Add more models as needed
];

final List<String> fruits = [
    '🍎 Apple',
    '🍋 Mango',
    '🍌 Banana',
    '🍉 Watermelon',
    '🍇 Grapes',
    '🍓 Strawberry',
    '🍒 Cherries',
    '🍑 Peach',
  ];
