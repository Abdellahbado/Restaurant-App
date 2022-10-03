class Meal {
  String description;
  String name;
  bool isliked;
  String imgLocation;
  num rating;
  Meal(
      {required this.description,
      required this.rating,
      required this.name,
      required this.isliked,
      required this.imgLocation});
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
