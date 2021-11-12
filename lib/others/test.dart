import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_type_reservation.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //USANDO FORM
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova reserva'),
        centerTitle: true,
        elevation: 4.0,
        actions: [
          //BOTÃO DO PERFIL
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 32,
            ),
            onPressed: () {},
            padding: const EdgeInsets.fromLTRB(8, 8, 24, 8),
          ),
        ],
      ),
    );
  }
}
