import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_type_reservation.dart';

class TypesReservations extends StatefulWidget {
  const TypesReservations({Key? key}) : super(key: key);

  @override
  _TypesReservationsState createState() => _TypesReservationsState();
}

class _TypesReservationsState extends State<TypesReservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Reserva'),
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
      //OPÇÕES DE RESERVA:
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        children: <Widget>[
          ButtonTypeReservation(
            textButton: 'Rent a Car',
            icon: Icons.directions_car_filled_sharp,
            iconColor: const Color.fromARGB(255, 255, 69, 0),
            functionExecuteOnPressed: testFunction,
          ),
          ButtonTypeReservation(
            textButton: 'Transporte Terrestre',
            icon: Icons.directions_bus,
            iconColor: const Color.fromARGB(255, 0, 128, 0),
            functionExecuteOnPressed: testFunction,
          ),
          ButtonTypeReservation(
            textButton: 'Turismo',
            icon: Icons.camera_alt,
            iconColor: const Color.fromARGB(255, 255, 69, 0),
            functionExecuteOnPressed: testFunction,
          ),
          ButtonTypeReservation(
            textButton: 'Catering',
            icon: Icons.dining_outlined,
            iconColor: const Color.fromARGB(255, 0, 128, 128),
            functionExecuteOnPressed: testFunction,
          ),
          ButtonTypeReservation(
            textButton: 'Equipe de Campo',
            icon: Icons.emoji_people,
            iconColor: const Color.fromARGB(255, 72, 61, 139),
            functionExecuteOnPressed: testFunction,
          ),
          ButtonTypeReservation(
            textButton: 'Fretamento de Aeronaves',
            icon: Icons.airplanemode_active_rounded,
            iconColor: const Color.fromARGB(255, 0, 128, 128),
            functionExecuteOnPressed: testFunction,
          ),
        ],
      ),
    );
  }

  testFunction() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Clicado'),
      ),
    );
  }
}
