import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';

class InfoScreen extends StatefulWidget {
  int index;
  InfoScreen({required this.index});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(popularMeals[widget.index].imgLocation),
          ),
          Container(
            // this column will contain the name of the food and the rating
            child: Column(
              children: [
                Text(
                  popularMeals[widget.index].name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // to show the rating
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.blueGrey,
                    ),
                    Text('${popularMeals[widget.index].rating}'),
                  ],
                ),
                const Text('Description'),
                const SizedBox(
                  height: 10.0,
                ),
                Text('${popularMeals[widget.index].description}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
