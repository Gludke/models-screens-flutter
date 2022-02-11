import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class DetailsReserve extends StatefulWidget {
  DateTime dateReserve;
  String passengers;
  String origin;
  String destiny;

  DetailsReserve({
    Key? key,
    required this.dateReserve,
    required this.passengers,
    required this.origin,
    required this.destiny,
    //required this.destiny,
  }) : super(key: key);

  @override
  _DetailsReserveState createState() => _DetailsReserveState();
}

class _DetailsReserveState extends State<DetailsReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(''),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200))),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: ListView(
          children: [
            //CONTAINER PARA COLOCAR O MAPA
            Container(
              child: Image.asset(
                "assets/mapExemple.JPG",
              ),
            ),
            Container(height: 16.0),
            //DADOS DA RESERVA
            Text(_dateFormat(widget.dateReserve),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 14.sp)),
            Container(height: 16.0),
            Text('Passageiros: ${widget.passengers}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp)),
            Container(height: 16.0),
            Text('Origem: ${widget.origin}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp)),
            Container(height: 16.0),
            Text('Destino: ${widget.destiny}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    fontSize: 12.sp))
          ],
        ),
      ),
    );
  }

  String _dateFormat(DateTime date) {
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(date); //retora a data formatada.
  }
}
