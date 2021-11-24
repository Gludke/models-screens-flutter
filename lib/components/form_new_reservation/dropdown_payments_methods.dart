import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DropDownPaymentMethods extends StatefulWidget {
  String dropdownPaymentMethod = 'Faturado';
  String? dropValueReturn;
  DropDownPaymentMethods({Key? key, required this.dropValueReturn})
      : super(key: key);

  @override
  State<DropDownPaymentMethods> createState() => _StateDropDownPaymentMethods();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StateDropDownPaymentMethods extends State<DropDownPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    //print(widget.dropdownPaymentMethod);

    return DropdownButton<String>(
      value: widget.dropdownPaymentMethod,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18.0),
      // underline: Container(
      //   height: 1,
      //   color: Colors.black,
      // ),
      items: <String>['Faturado', 'Cartão de crédito', 'Cash']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownPaymentMethod = newValue!;
          widget.dropValueReturn = newValue;
        });
      },
    );
  }
}
