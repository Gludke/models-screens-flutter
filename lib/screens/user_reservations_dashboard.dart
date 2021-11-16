import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserReservationDashboard extends StatefulWidget {
  String nameUser;

  UserReservationDashboard({
    Key? key,
    required this.nameUser,
  }) : super(key: key);

  @override
  _UserReservationsState createState() => _UserReservationsState();
}

class _UserReservationsState extends State<UserReservationDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        actions: [
          //'expanded' faz o widget preencher todo o espaço disponível do pai.
          Expanded(
            child: Row(
              children: [
                //NOME USUÁRIO:
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 45, 0, 0),
                    child: Text(
                      'Olá, ' + widget.nameUser,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                //BOTÃO DE NOVA RESERVA:
                Expanded(
                  child: Container(
                    height: 40.0,
                    //Estilo do botão:
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 1],
                        colors: [
                          Color(0xFF84FFFF),
                          Color(0xFF18FFFF),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextButton(
                      child: const Text(
                        'Nova Reserva',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                //ÍCONE PERFIL DO USUÁRIO:
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body: ,
    );
  }
}
