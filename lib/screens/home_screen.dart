import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:restau_app/screens/home_page.dart';
import 'package:restau_app/widgets/reserv_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final bottomNavBarScreens = [
    HomePage(),
    Center(
      child: const Text(
        'Search Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: const Text(
        'Liked',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    ReservForm(),
    
    Center(
      child: const Text(
        'Personal Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: bottomNavBarScreens.elementAt(selectedIndex)),
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GNav(
              selectedIndex: selectedIndex,
              onTabChange: (value) => setState(() {
                    selectedIndex = value;
                  }),
              gap: 8,
              backgroundColor: Colors.grey.shade300,
              tabBackgroundColor: Colors.grey.shade600,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Liked',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Reservation',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Personal',
                ),
              ]),
        ),
      ),
    );
  }
}
