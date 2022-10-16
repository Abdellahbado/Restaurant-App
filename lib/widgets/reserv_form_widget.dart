import 'package:flutter/material.dart';
import 'package:restau_app/models/meal_model.dart';
import 'package:restau_app/models/user_model.dart';
import 'package:restau_app/services/firebase_crud.dart';

class ReservForm extends StatefulWidget {
  final Function? toggle;
  ReservForm({this.toggle});

  @override
  State<ReservForm> createState() => _ReservFormState();
}

class _ReservFormState extends State<ReservForm> {
  final _nameController = TextEditingController();
  final _foodOrderedController = TextEditingController();
  final _dayController = TextEditingController();

  FirebaseCrud instance = FirebaseCrud();

  //function to add user to firebase
  // Future addUser({required User user}) async {
  //   final docUser =
  //       FirebaseFirestore.instance.collection('Reference').doc(user.name);
  //   // the username above is an id ,if you dont write it will be auto generated

  //   final json = user.toJson();
  //   await docUser.set(json);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Luna Restaurant',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextFormField(
              controller: _nameController,
              autofocus: false,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
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
              controller: _foodOrderedController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "What do you want to order",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
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
              controller: _dayController,
              decoration: const InputDecoration(
                labelText:
                    'Enter the date (for the order formated such 2022-02-27 )',
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          IconButton(
            onPressed: () async {
              var response = await FirebaseCrud.addUser(
                  date: DateTime.parse(_dayController.text),
                  foodOrdered: _foodOrderedController.text,
                  name: _nameController.text,
                  tableNumber: tableNumber);
              // if the user was added successfully
              if (response.code == 200) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              }
              widget.toggle!();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
