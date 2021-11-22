import 'package:flutter/material.dart';
import 'package:loginscreen/others/validates.dart';

class FieldInputNewReserve extends StatelessWidget {
  final TextEditingController controller;
  final int minCharacters;
  final bool activeValidator;
  final String? labelTextOfInput;
  final TextInputType textInputType;
  final String? msgError;
  final double? paddingTop;
  final OutlineInputBorder? border;
  final int? maxLines;

  const FieldInputNewReserve(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.minCharacters,
      required this.activeValidator,
      this.labelTextOfInput,
      this.msgError,
      this.border,
      this.maxLines,
      this.paddingTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, (paddingTop ?? 0), 0, 0),
      child: TextFormField(
        controller: controller,
        validator: (valueInput) {
          //Só funciona se a propriedade Não for nula e não estiver vazia:
          if (msgError != null && msgError!.isNotEmpty) {
            return validadeLength(valueInput!, msgError);
          }
        },
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: labelTextOfInput, //Título da label
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          border: border,
        ),
        keyboardType: textInputType,
        maxLines: maxLines,
      ),
    );
  }
}
