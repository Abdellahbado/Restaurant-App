class User {
  String name;
  String? id;
  String reservationDate;
  String startDay;
  int numNights;
  User(
      {required this.name,
      this.id,
      required this.reservationDate,
      required this.startDay,
      required this.numNights});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Reservation Date': reservationDate,
        'Start Day': startDay,
        'Number Nights': numNights
      };

  // static User fromJson(Map<String, dynamic> json) => User(
  //       id: json('id'),
  //       name: json('name'),
  //       reservationDate: json('Reservation Date'),
  //       numNights: json('Number Nights'),
  //       startDay: json('Start Day'),
  //     );
}
