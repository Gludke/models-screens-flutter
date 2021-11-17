import 'package:flutter/material.dart';
import 'package:loginscreen/others/validates.dart';

class FieldInputNewReserve extends StatelessWidget {
  final TextEditingController controller;
  final int minCharacters;
  final String msgError;
  final String labelTextOfInput;
  final TextInputType textInputType;
  final double? paddingTop;

  FieldInputNewReserve(
      {required this.controller,
      required this.minCharacters,
      required this.msgError,
      required this.labelTextOfInput,
      required this.textInputType,
      this.paddingTop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, (paddingTop ?? 0), 16, 0),
      child: TextFormField(
        controller: controller,
        validator: (valueInput) {
          return validadeInput(valueInput!, minCharacters, msgError);
        },
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: labelTextOfInput, //Título da label
        ),
        keyboardType: textInputType,
      ),
    );
  }
}
