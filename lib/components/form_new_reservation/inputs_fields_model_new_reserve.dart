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
  final double? labelFontSize;
  final double? fontSize;
  final String? hintText;
  final int? maxLength;
  final bool? obscureText;

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
      this.labelFontSize,
      this.fontSize,
      this.hintText,
      this.maxLength,
      this.obscureText,
      this.paddingTop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, (paddingTop ?? 0), 0, 0),
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        validator: (valueInput) {
          //Só funciona se a propriedade Não for nula e não estiver vazia:
          if (msgError != null && msgError!.isNotEmpty) {
            return validadeLength(valueInput!, msgError);
          }
        },
        style: TextStyle(
          fontSize: fontSize ?? 24.0,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          labelText: labelTextOfInput, //Título da label
          labelStyle: TextStyle(fontSize: labelFontSize ?? 20),
          border: border,
        ),
        keyboardType: textInputType,
        maxLines: maxLines,
        obscureText: (maxLines == 1
            ? obscureText!
            : false), //essa prop só funciona com 1 linha em maxLines.
      ),
    );
  }
}
