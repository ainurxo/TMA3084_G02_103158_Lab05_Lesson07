import 'package:flutter/material.dart';

import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNaviLab(),
    );
  }
}

class BottomNaviLab extends StatefulWidget {
  const BottomNaviLab({super.key});

  @override
  State<BottomNaviLab> createState() => _BottomNaviLabState();
}

class _BottomNaviLabState extends State<BottomNaviLab> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttom Navigation Bar"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        iconSize: 35,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
        ],
      ),
    );
  }
}
