import 'package:flutter/material.dart';

class RecoveryPass extends StatefulWidget {
  const RecoveryPass({Key? key}) : super(key: key);

  @override
  _RecoveryPassState createState() => _RecoveryPassState();
}

class _RecoveryPassState extends State<RecoveryPass> {
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
      ]),
    );
  }
}
