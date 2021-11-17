import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserReservationDashboard extends StatefulWidget {
  final String nameUser;

  const UserReservationDashboard({
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
        toolbarHeight: 70.0,
        actions: [
          //'expanded' faz o widget preencher todo o espaço disponível do pai.
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //NOME USUÁRIO:
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 24.0, 0, 0),
                    child: Text(
                      'Olá, ' + widget.nameUser,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                //TÍTULO PÁGINA:
                const Expanded(
                    flex: 6,
                    child: Text(
                      'Reservas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    )),
                //ÍCONE PERFIL DO USUÁRIO:
                Expanded(
                  flex: 2,
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
      body: Column(
        children: [
          //BOTÕES DE SELEÇÃO:
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Botão1'),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Botão2'),
                  ),
                ),
              ],
            ),
          ),
          //LIST DE RESERVAS:
          //ListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 36.0,
        ),
        onPressed: () {},
      ),
    );
  }
}
