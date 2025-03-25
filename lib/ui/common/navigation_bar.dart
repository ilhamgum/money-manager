import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
            onTabChange: (value) => log(value.toString()),
            padding: const EdgeInsets.all(16),
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.greenAccent,
            tabBackgroundColor: Colors.white,
            iconSize: 30,
            gap: 8,
            tabs: const [
              GButton(
                text: 'Home',
                icon: Icons.home_outlined,
              ),
              GButton(
                text: 'Wallet',
                icon: Icons.wallet_outlined,
              ),
              GButton(
                text: 'Graph',
                icon: Icons.bar_chart,
              ),
              GButton(
                text: 'Settings',
                icon: Icons.person_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
