import 'package:flutter/material.dart';
import 'package:restau_app/widgets/popular_meals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Stream<List<User>> getUsers() => FirebaseFirestore.instance.collection('Reference').snapshots()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Hotel App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          PopularMeals(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Your last reservations',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}