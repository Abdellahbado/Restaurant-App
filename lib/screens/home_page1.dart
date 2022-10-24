import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';
import 'package:restau_app/widgets/popular_tile.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Restaurant App Luna',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Find the best food for you",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 30.0,
              wordSpacing: 1.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Find your food",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Popular food',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        const PopularTile(),
        
      ]),
    );
  }
}
