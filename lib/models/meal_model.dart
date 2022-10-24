class Meal {
  String? description;
  String name;
  bool isliked;
  String imgLocation;
  double rating;
  Meal(
      {this.description,
      required this.rating,
      required this.name,
      required this.isliked,
      required this.imgLocation});

  factory Meal.fromJson(dynamic json) {
    return Meal(
        name: json['name'] as String,
        imgLocation: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        isliked: true);
  }

  static List<Meal> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Meal.fromJson(data);
    }).toList();
  }
}

Meal couscous = Meal(
    description: 'Couscous',
    name: 'Couscous',
    isliked: false,
    imgLocation: 'assets/images/Couscous.png',
    rating: 5.0);

Meal rechta = Meal(
    description: 'Rechta',
    name: 'Rechta',
    isliked: false,
    imgLocation: 'assets/images/Rechta.png',
    rating: 5.0);
Meal chorba = Meal(
    description: 'chorba',
    name: 'chorba',
    isliked: true,
    imgLocation: 'assets/images/chorba.png',
    rating: 4.0);
Meal hrira = Meal(
    description: 'hrira',
    name: 'hrira',
    isliked: true,
    imgLocation: 'assets/images/hrira.png',
    rating: 5.0);

List<Meal> popularMeals = [couscous, rechta, chorba, hrira];
int tableNumber = 1;
