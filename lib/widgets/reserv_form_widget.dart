import 'package:flutter/material.dart';
import 'package:restau_app/models/user_model.dart';

class ReservForm extends StatefulWidget {
  final Function? toggle;
  ReservForm({this.toggle});

  @override
  State<ReservForm> createState() => _ReservFormState();
}

class _ReservFormState extends State<ReservForm> {
  final _nameController = TextEditingController();
  final _numNightController = TextEditingController();
  final _reservController = TextEditingController();
  final _startDayController = TextEditingController();

  //function to add user to firebase
  Future addUser({required User user}) async {
    final docUser =
        FirebaseFirestore.instance.collection('Reference').doc(user.name);
    // the username above is an id ,if you dont write it will be auto generated

    final json = user.toJson();
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luna Hotel',style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your full name',
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              controller: _numNightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'For how many nights you\'re going to stay ',
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              controller: _reservController,
              decoration: const InputDecoration(
                labelText: 'Enter the current date',
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              controller: _startDayController,
              decoration: const InputDecoration(
                labelText: 'The start day of your reservation',
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          IconButton(
            onPressed: () {
              User user = User(
                name: _nameController.text,
                numNights: int.parse(_numNightController.text),
                reservationDate: _reservController.text,
                startDay: _startDayController.text,
              );
              addUser(user: user);
              widget.toggle!();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
