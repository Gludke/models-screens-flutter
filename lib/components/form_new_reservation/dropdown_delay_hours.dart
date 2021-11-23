import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DropDownDelayHours extends StatefulWidget {
  String dropdownValue;
  DropDownDelayHours({Key? key, required this.dropdownValue}) : super(key: key);

  @override
  State<DropDownDelayHours> createState() => _StateDropDownDelayHours();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StateDropDownDelayHours extends State<DropDownDelayHours> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.access_time),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      // underline: Container(
      //   height: 1,
      //   color: Colors.black,
      // ),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
        });
      },
      items: <String>[
        '0',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12',
        '13',
        '14',
        '15',
        '16',
        '17',
        '18'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
