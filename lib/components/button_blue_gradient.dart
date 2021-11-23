import 'package:flutter/material.dart';

class ButtonBlueGradient extends StatefulWidget {
  final Function() click;
  final String textButton;
  final double? paddingLeft;
  final double? paddingRight;
  const ButtonBlueGradient(
      {Key? key,
      required this.click,
      required this.textButton,
      this.paddingLeft,
      this.paddingRight})
      : super(key: key);

  @override
  _ButtonBlueGradientState createState() => _ButtonBlueGradientState();
}

class _ButtonBlueGradientState extends State<ButtonBlueGradient> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          (widget.paddingLeft ?? 80), 40, (widget.paddingRight ?? 80), 0),
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
            onPressed: widget.click,
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
