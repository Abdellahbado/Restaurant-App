import 'dart:convert';
import 'package:restau_app/models/meal_model.dart';
import 'package:http/http.dart' as http;

class MealApi {
  static Future<List<Meal>> getMeal() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "d67310f5d2msh4338d57d945e0afp13913djsn060e1fdfb3f9",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Meal.recipesFromSnapshot(temp);
  }
}
