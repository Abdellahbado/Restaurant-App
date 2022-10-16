class User {
  String name;
  int tableNumber;
  String foodOrdered;
  DateTime date;
  User(
      {required this.name,
      required this.tableNumber,
      required this.foodOrdered,
      required this.date});

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'Reservation Date': reservationDate,
  //       'Start Day': startDay,
  //       'Number Nights': numNights
  //     };

  // static User fromJson(Map<String, dynamic> json) => User(
  //       id: json('id'),
  //       name: json('name'),
  //       reservationDate: json('Reservation Date'),
  //       numNights: json('Number Nights'),
  //       startDay: json('Start Day'),
  //     );
}
