import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/button_type_reservation.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //USANDO FORM
    return Scaffold();
  }
}

// //BOTÃO DE NOVA RESERVA:
//                 Expanded(
//                   child: Container(
//                     height: 40.0,
//                     //Estilo do botão:
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         stops: [0.1, 1],
//                         colors: [
//                           Color(0xFF84FFFF),
//                           Color(0xFF18FFFF),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: TextButton(
//                       child: const Text(
//                         'Nova Reserva',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),