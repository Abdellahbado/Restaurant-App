import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';
import 'package:restau_app/models/meal.api.dart';
import 'package:restau_app/widgets/meal_card.dart';

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  bool isLoading = true;
  late List<Meal> _meals;
  @override
  void initState() {
    super.initState();
    getMeals();
  }

  Future<void> getMeals() async {
    _meals = await MealApi.getMeal();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipe Api test',
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _meals.length,
              itemBuilder: ((context, index) {
                return MealCard(
                  name: _meals[index].name,
                  isLiked: _meals[index].isliked,
                  imgLocation: _meals[index].imgLocation,
                  rating: _meals[index].rating,
                );
              }),
            ),
    );
  }
}
