import 'package:flutter/material.dart';

class ButtonBlueGradient extends StatefulWidget {
  final Function? functionExecuteOnPressed;
  final String textButton;
  //Construtor recebe a função que será executada no enPressed.
  const ButtonBlueGradient({
    Key? key,
    this.functionExecuteOnPressed,
    required this.textButton,
  }) : super(key: key);

  @override
  _ButtonBlueGradientState createState() => _ButtonBlueGradientState();
}

class _ButtonBlueGradientState extends State<ButtonBlueGradient> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 40, 80, 0),
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [
              Color(0xFFBBDEFB),
              Color(0XFF0D47A1),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        //Faz o botão ocupar todo o espaço do container:
        child: SizedBox.expand(
          child: TextButton(
            onPressed: () {
              widget.functionExecuteOnPressed?.call();
            },
            child: Text(
              widget.textButton,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
