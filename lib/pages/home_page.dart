// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:breast_cancer_app/pages/breastcancer_page.dart';
import 'package:breast_cancer_app/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    BreastCancerPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.deepPurple[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: BottomNavigationBar(
            backgroundColor: Colors.deepPurple.shade200,
            currentIndex: _selectedIndex,
            onTap: _navigateBottomBar,
            // ignore: prefer_const_literals_to_create_immutables
            type: BottomNavigationBarType.fixed,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_services_outlined),
                label: 'Cancer Detection',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_accessibility_outlined),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
