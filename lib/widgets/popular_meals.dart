import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';

class PopularMeals extends StatefulWidget {
  const PopularMeals({super.key});

  @override
  State<PopularMeals> createState() => _PopularMealsState();
}

class _PopularMealsState extends State<PopularMeals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Meals',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularMeals.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
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
        )
      ],
    );
  }
}
