import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //USANDO FORM
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
