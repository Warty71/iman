import 'package:code_master/pages/filler_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../pages/home_page.dart';
import '../pages/user_page.dart';

class CmSnakeBar extends StatefulWidget {
  const CmSnakeBar({super.key});

  @override
  State<CmSnakeBar> createState() => _CmSnakeBarState();
}

class _CmSnakeBarState extends State<CmSnakeBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const FillerPage(),
    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        backgroundColor: Theme.of(context).colorScheme.primary,
        snakeViewColor: Theme.of(context).colorScheme.secondary,
        snakeShape: SnakeShape.circle,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          BottomNavigationBarItem(
            label: "Filler",
            icon: Icon(
              Icons.book,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          BottomNavigationBarItem(
            label: "User",
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
