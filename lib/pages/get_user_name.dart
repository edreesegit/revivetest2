// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child('users');
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Text('User not signed in');
    }

    return StreamBuilder<DatabaseEvent>(
      stream: usersRef.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        final User? user = FirebaseAuth.instance.currentUser;
        if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
          final dynamic value = snapshot.data!.snapshot.value;
          Map<dynamic, dynamic> userData = {};
          value.forEach((key, value) {
            if (user != null && user.uid == key) {
              userData = value;
            }
          });
          print(userData);
          final String firstName =
              userData.containsKey('first name') ? userData['first name'] : '';
          final String lastName =
              userData.containsKey('last name') ? userData['last name'] : '';
          final String username = 'Welcome, $firstName!';
          return Text(
            username,
            style: GoogleFonts.raleway(
              fontSize: 28, // Change the font size to your desired size
              color:
                  Colors.black, // Change the font color to your desired color
              fontWeight: FontWeight.bold,
            ),
          ); // Add font weight if desired);
        } else {
          return Text('User data not found');
        }
      },
    );
  }
}
