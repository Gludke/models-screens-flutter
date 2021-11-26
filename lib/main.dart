import 'package:flutter/material.dart';
import 'package:loginscreen/screens/new_reservation.dart';
import 'package:loginscreen/screens/types_reservations.dart';
import 'package:loginscreen/screens/user_profile.dart';
import 'package:loginscreen/screens/user_reservations_dashboard.dart';

import 'others/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: UserProfile(),

      //UserReservationDashboard(nameUser: 'Nome usuário'),
    );
  }
}
