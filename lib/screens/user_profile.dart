import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/form_new_reservation/inputs_fields_model_new_reserve.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _controllerFieldOldPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Seu perfil'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200))),
        actions: [
          //ICONE USUÁRIO
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 40,
              ),
              onPressed: () => _testTap(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //NOME DO USUÁRIO
                const Text('Nome',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text('Pedro de Alcântara', style: TextStyle(fontSize: 18.0)),
                //EMAIL DO USUÁRIO
                Container(height: 24.0),
                const Text('E-mail',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text('alcantara_p@gmail.com', style: TextStyle(fontSize: 18.0)),
                //SENHA DO USUÁRIO
                Container(height: 24.0),
                const Text('Senha',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Text('*************', style: TextStyle(fontSize: 18.0)),
                    Container(width: 10.0),
                    Material(
                      child: InkWell(
                        child: const CircleAvatar(
                          child: Icon(Icons.mode_edit),
                        ),
                        onTap: () => _testTap(),
                      ),
                    )
                  ],
                ),
                //CAMPOS PARA TROCA DA SENHA
                Visibility(
                  visible: true,
                  child: Column(
                    children: [
                      FieldInputNewReserve(
                        maxLines: 1,
                        controller: _controllerFieldOldPass,
                        fontSize: 18.0,
                        minCharacters: 4,
                        labelTextOfInput: 'Senha atual',
                        activeValidator: true,
                        msgError: 'O campo precisa ser preenchido',
                        textInputType: TextInputType.text,
                        obscureText: true,
                        paddingTop: 24,
                        border: const OutlineInputBorder(),
                      ),
                      FieldInputNewReserve(
                        maxLines: 1,
                        controller: _controllerFieldOldPass,
                        fontSize: 18.0,
                        minCharacters: 4,
                        labelTextOfInput: 'Nova senha',
                        activeValidator: true,
                        msgError: 'O campo precisa ser preenchido',
                        textInputType: TextInputType.text,
                        obscureText: true,
                        paddingTop: 24,
                        border: const OutlineInputBorder(),
                      ),
                      FieldInputNewReserve(
                        maxLines: 1,
                        controller: _controllerFieldOldPass,
                        fontSize: 18.0,
                        minCharacters: 4,
                        labelTextOfInput: 'Repetir nova senha',
                        activeValidator: true,
                        msgError: 'O campo precisa ser preenchido',
                        textInputType: TextInputType.text,
                        obscureText: true,
                        paddingTop: 8.0,
                        border: const OutlineInputBorder(),
                      ),
                      //MSG DE ERRO SENHAS DIFERENTES
                      Visibility(
                        visible: true,
                        child: Column(
                          children: [
                            Container(height: 10),
                            const Text('As senhas não são iguais',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.red)),
                          ],
                        ),
                      ),
                      //BOTÃO TROCAR SENHA
                      // ButtonBlueGradient(
                      //   textButton: 'Trocar senha',
                      //   click: _testTap(),
                      // ),
                    ],
                  ),
                ),
                //SAIR DA CONTA
                Container(height: 88.0),
                Row(
                  children: [
                    const Text('Sair da conta',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500)),
                    Container(width: 10.0),
                    Material(
                      child: InkWell(
                        child: const CircleAvatar(
                          child: Icon(Icons.logout),
                        ),
                        onTap: () => _testTap(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _testTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      //Barra inferior de msg
      const SnackBar(
        duration: Duration(milliseconds: 400),
        content: Text('Teste de botão'),
      ),
    );
  }
}
