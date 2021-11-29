import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/form_new_reservation/inputs_fields_model_new_reserve.dart';
import 'package:loginscreen/components/msg_error.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController _controllerFieldCurrentPass = TextEditingController();
  var _controllerFieldNewPass = TextEditingController();
  var _controllerFieldTestNewPass = TextEditingController();

  bool errorPassNotEqualsVisibility = false;
  bool replacePassVisibility = false;
  bool errorSizePassVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Seu perfil'),
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
        padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
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
                        onTap: () => _formToReplacePass(),
                      ),
                    )
                  ],
                ),
                //CAMPOS PARA TROCA DA SENHA
                Visibility(
                  visible: replacePassVisibility,
                  child: Column(
                    children: [
                      FieldInputNewReserve(
                        maxLines: 1,
                        controller: _controllerFieldCurrentPass,
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
                        controller: _controllerFieldNewPass,
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
                        controller: _controllerFieldTestNewPass,
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
                      //MSGS DE ERRO: SENHAS DIFERENTES E PEQUENAS
                      MsgError(
                          visible: errorPassNotEqualsVisibility,
                          msgError: 'As senhas não são iguais'),
                      MsgError(
                          visible: errorSizePassVisibility,
                          msgError: 'A senha precisa ter mais de 6 caracteres'),
                      //BOTÃO TROCAR SENHA
                      ButtonBlueGradient(
                        paddingLeft: 0,
                        paddingRight: 0,
                        paddingTop: 16.0,
                        textButton: 'Trocar senha',
                        click: () => _replaceUserPass(),
                      ),
                    ],
                  ),
                ),
                //SAIR DA CONTA
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 24.0),
                  child: Row(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _testTap() async {
    ScaffoldMessenger.of(context).showSnackBar(
      //Barra inferior de msg
      const SnackBar(
        duration: Duration(milliseconds: 400),
        content: Text('Teste de botão'),
      ),
    );
  }

  void _formToReplacePass() async {
    setState(() {
      replacePassVisibility = !replacePassVisibility;
    });
  }

  void _replaceUserPass() async {
    if (_controllerFieldNewPass.text.length < 6) {
      setState(() {
        errorSizePassVisibility = true;
        errorPassNotEqualsVisibility = false;
        _clearFields();
      });
    } else if (_controllerFieldNewPass.text !=
        _controllerFieldTestNewPass.text) {
      setState(() {
        errorPassNotEqualsVisibility = true;
        errorSizePassVisibility = false;
        _clearFields();
      });
    } else {
      setState(() {
        errorSizePassVisibility = false;
        errorPassNotEqualsVisibility = false;
        _clearFields();
        _formToReplacePass();
        ScaffoldMessenger.of(context).showSnackBar(
            //Barra de msg
            const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Text('Senha atualizada com sucesso.',
                    style: TextStyle(fontSize: 20.0))));
      });
    }
  }

  void _clearFields() async {
    _controllerFieldCurrentPass.text = "";
    _controllerFieldNewPass.text = "";
    _controllerFieldTestNewPass.text = "";
  }
}
