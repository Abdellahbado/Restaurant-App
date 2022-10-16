import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
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
        Expanded(
          child: SizedBox(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMeals.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(popularMeals[index].imgLocation),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(popularMeals[index].name),
                          Text(
                            '★ ${popularMeals[index].rating}',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
