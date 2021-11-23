import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/inputs_fields_model_login.dart';

class RecoveryPass extends StatefulWidget {
  const RecoveryPass({Key? key}) : super(key: key);

  @override
  _RecoveryPassState createState() => _RecoveryPassState();
}

class _RecoveryPassState extends State<RecoveryPass> {
  final TextEditingController _controllerInputRecovery =
      TextEditingController();

  final _keyFormRecovery = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperação de Senha')),
      body: ListView(children: [
        //Logo da empresa:
        SizedBox(
          height: 256,
          width: 256,
          child: Image.asset(
            "images/logo_CEP.jpg",
          ),
        ),
        Form(
          key: _keyFormRecovery,
          child: Column(
            children: [
              //INPUT DE LOGIN OU CÓDIGO
              FieldInput(
                controller: _controllerInputRecovery,
                minCharacters: 4,
                labelTextOfInput: 'Seu e-mail ou Código de cliente',
                msgError: 'Favor um e-mail ou código válido',
                textInputType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        //BOTÃO DE RECUPERAÇÃO DE SENHA
        ButtonBlueGradient(
          textButton: 'Solicitar Senha',
          click: _recoveryPass,
        ),
      ]),
    );
  }

  void _recoveryPass() async {
    if (_keyFormRecovery.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        //Barra inferior de msg
        const SnackBar(
          content: Text('Nova senha enviada para seu e-mail.'),
        ),
      );
    }
  }
}
