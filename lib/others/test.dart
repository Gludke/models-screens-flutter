import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/button_type_reservation.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    //USANDO FORM
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testando Visibility'),
      ),
      body: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Container(height: 10),
                Container(height: 100, width: 100, color: Colors.black),
              ],
            ),
          ),
          Container(height: 10),
          Container(height: 100, width: 100, color: Colors.blue),
          Container(height: 10),
          Container(height: 100, width: 100, color: Colors.red),
          ButtonBlueGradient(
            paddingLeft: 0,
            paddingRight: 0,
            textButton: 'Testando..',
            click: () => validateForm(),
          ),
        ],
      ),
    );
  }

  validateForm() {
    setState(() => isVisible = !isVisible);
  }
}
