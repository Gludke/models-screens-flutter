import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/inputs_fields_model_login.dart';
import 'package:loginscreen/screens/recover_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

//Implementação do State
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerFieldEmail = TextEditingController();
  final TextEditingController _controllerFieldPass = TextEditingController();

  final _formLoginKey =
      GlobalKey<FormState>(); //chave que serve para chamar o formulário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
        child: ListView(
          children: [
            //LOGO DA EMPRESA:
            SizedBox(
              height: 256,
              width: 256,
              child: Image.asset(
                "images/logo_CEP.jpg",
              ),
            ),

            Form(
              key: _formLoginKey,
              child: Column(
                children: [
                  //INPUT DO E-MAIL:
                  FieldInput(
                    controller: _controllerFieldEmail,
                    minCharacters: 4,
                    labelTextOfInput: 'Seu e-mail ou Código de cliente',
                    msgError: 'Favor digitar um login válido',
                    textInputType: TextInputType.emailAddress,
                  ),
                  //INPUT DA SENHA:
                  FieldInput(
                    controller: _controllerFieldPass,
                    minCharacters: 5,
                    labelTextOfInput: 'Sua senha',
                    msgError: 'Favor digitar uma senha válida',
                    textInputType: TextInputType.text,
                    paddingTop: 16,
                  ),
                ],
              ),
            ),
            //BOTÃO DE RECUPERAÇÃO DE SENHA:
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
              child: Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _openPageRecoveryPass(context),
                  child: const Text(
                    'Recuperar senha',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            //BOTÃO DE LOGIN:
            ButtonBlueGradient(
              textButton: 'Login',
              click: _doLogin,
            ),
            //BOTÃO PARA ENTRAR SEM LOGIN:
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 8, 80, 0),
              child: SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Entrar sem login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _doLogin() async {
    //Valida os campos do formulário. Em caso de erro, mostra a msg definida.
    _formLoginKey.currentState!.validate();
  }

  void _openPageRecoveryPass(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const RecoveryPass();
      }),
    );
  }
}
