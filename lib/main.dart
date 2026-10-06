import 'package:flutter/material.dart';

import 'browse.dart';
import 'home.dart';
import 'inbox.dart';
import 'profile.dart';
import 'saved.dart';

void main() {
  runApp(const BookNookApp());
}

class BookNookApp extends StatelessWidget {
  const BookNookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF356B57)),
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  static const _pages = [
    HomePage(),
    BrowsePage(),
    SavedPage(),
    InboxPage(),
    ProfilePage(),
  ];

  static const _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.explore_outlined),
      selectedIcon: Icon(Icons.explore_rounded),
      label: 'Browse',
    ),
    NavigationDestination(
      icon: Icon(Icons.bookmark_border_rounded),
      selectedIcon: Icon(Icons.bookmark_rounded),
      label: 'Saved',
    ),
    NavigationDestination(
      icon: Icon(Icons.mail_outline_rounded),
      selectedIcon: Icon(Icons.mail_rounded),
      label: 'Inbox',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: _destinations,
      ),
    );
  }
}
