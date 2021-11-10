import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/components/inputs_fields.dart';
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
            //logo da empresa:
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
                  //Input do E-mail:
                  FieldInput(
                    controller: _controllerFieldEmail,
                    minCharacters: 4,
                    labelTextOfInput: 'Seu e-mail ou Código de cliente',
                    msgError: 'Favor digitar um login válido',
                    textInputType: TextInputType.emailAddress,
                  ),
                  //Input da Senha:
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

            //Botão de Recuperação de Senha:
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
            //Botão de LOGIN:
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 40, 80, 0),
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFBBDEFB),
                      Color(0XFF0D47A1),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                //Faz o botão ocupar todo o espaço do container:
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                      _doLogin();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //BOTÃO PARA ENTRAR SEM LOGIN:
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 8, 80, 0),
              child: Container(
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
    _formLoginKey.currentState?.validate();
  }

  void _openPageRecoveryPass(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return RecoveryPass();
      }),
    );
  }
}
