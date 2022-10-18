import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';
import 'package:restau_app/screens/meal_info_screen.dart';

class PopularTile extends StatefulWidget {
  const PopularTile({super.key});

  @override
  State<PopularTile> createState() => _PopularTileState();
}

class _PopularTileState extends State<PopularTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularMeals.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(index: index),
                  ),
                );
              },
              child: Column(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
