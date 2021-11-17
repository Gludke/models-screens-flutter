import 'package:flutter/material.dart';
import 'package:loginscreen/components/inputs_fields_model_new_reserve.dart';

class NewReservation extends StatefulWidget {
  const NewReservation({Key? key}) : super(key: key);

  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  final TextEditingController _controllerFieldTest1 = TextEditingController();
  final TextEditingController _controllerFieldTest2 = TextEditingController();

  final _formLoginKey =
      GlobalKey<FormState>(); //chave que serve para chamar o formulário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formLoginKey,
            child: Column(
              children: [
                FieldInputNewReserve(
                  controller: _controllerFieldTest1,
                  minCharacters: 4,
                  labelTextOfInput: 'Seu e-mail ou Código de cliente',
                  msgError: 'Favor digitar um login válido',
                  textInputType: TextInputType.emailAddress,
                ),
                FieldInputNewReserve(
                  controller: _controllerFieldTest2,
                  minCharacters: 4,
                  labelTextOfInput: 'Seu e-mail ou Código de cliente',
                  msgError: 'Favor digitar um login válido',
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
