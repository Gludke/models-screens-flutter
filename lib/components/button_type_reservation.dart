import 'package:flutter/material.dart';

class ButtonTypeReservation extends StatefulWidget {
  final Function? functionExecuteOnPressed;
  final String textButton;
  final IconData icon;
  final Color iconColor;

  //Construtor recebe a função que será executada no enPressed.
  const ButtonTypeReservation({
    Key? key,
    this.functionExecuteOnPressed,
    required this.textButton,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  _ButtonTypeReservationState createState() => _ButtonTypeReservationState();
}

class _ButtonTypeReservationState extends State<ButtonTypeReservation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BOTÃO DA OPÇÃO DE RESERVA:
        Container(
          height: 80,
          width: 80,
          alignment: null,
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
          //Porção do botão que é clicável:
          child: TextButton(
            onPressed: () {
              widget.functionExecuteOnPressed?.call();
            },
            child: Icon(
              widget.icon,
              color: widget.iconColor,
              size: 40,
            ),
          ),
        ),
        //TEXTO DA OPÇÃO DE RESERVA:
        Text(
          widget.textButton,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
