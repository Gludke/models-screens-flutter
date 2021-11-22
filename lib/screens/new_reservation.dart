import 'package:flutter/material.dart';
import 'package:loginscreen/components/button_blue_gradient.dart';
import 'package:loginscreen/components/form_new_reservation/dropdown_delay_hours.dart';
import 'package:loginscreen/components/form_new_reservation/inputs_fields_model_new_reserve.dart';
import 'package:loginscreen/others/test_vehicle.dart';

class NewReservation extends StatefulWidget {
  final String nameReservation;

  NewReservation({
    Key? key,
    required this.nameReservation,
  }) : super(key: key);

  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  final tableTest =
      TestVehicle.listTestVehicles; //TABELA DE TESTE PARA O LISTVIEW

  final TextEditingController _controllerFieldTest1 = TextEditingController();
  final TextEditingController _controllerFieldTest2 = TextEditingController();
  late DateTime? dateStartReserve = null;
  late TimeOfDay? timeStartReserve = null;

  final _formNewReserveKey =
      GlobalKey<FormState>(); //chave que serve para chamar o formulário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.nameReservation,
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formNewReserveKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //ÍCONE ÍNICIO DA PARTIDA DA RESERVA
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                      ),
                      const Text(
                        'Início:',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  //BOTÕES PARA SELEÇÃO DE DATA E HORA DA PARTIDA
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              getDateText(),
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade100),
                            ),
                            onPressed: () => pickDate(context),
                          ),
                        ),
                        Container(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              getTimeText(),
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade100),
                            ),
                            onPressed: () => pickTime(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //CAMPO ORIGEM DA VIAGEM
                  FieldInputNewReserve(
                    controller: _controllerFieldTest1,
                    minCharacters: 4,
                    labelTextOfInput: 'Origem*',
                    activeValidator: true,
                    msgError: 'O campo precisa ser preenchido',
                    textInputType: TextInputType.streetAddress,
                    paddingTop: 16,
                    border: const OutlineInputBorder(),
                  ),
                  //TEMPO DE ESPERA DA ORIGEM
                  Row(
                    children: const [
                      Text(
                        'Tempo de espera, caso haja:  ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropDownDelayHours(),
                      Text(
                        'h',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  //CAMPO DESTINO DA VIAGEM
                  FieldInputNewReserve(
                    controller: _controllerFieldTest2,
                    minCharacters: 4,
                    labelTextOfInput: 'Destino*',
                    activeValidator: true,
                    msgError: 'O campo precisa ser preenchido',
                    textInputType: TextInputType.streetAddress,
                    paddingTop: 16,
                    border: const OutlineInputBorder(),
                  ),
                  //TEMPO DE ESPERA DO DESTINO
                  Row(
                    children: const [
                      Text(
                        'Tempo de espera, caso haja:  ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropDownDelayHours(),
                      Text(
                        'h',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  //LISTA DE VEÍCULOS DISPONÍVEIS
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 16.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (_, _____) => const Divider(),
                    itemCount: tableTest.length,
                    itemBuilder: (context, vehicle) {
                      return ListTile(
                        leading: Image.asset(tableTest[vehicle].icon),
                        title: Text(
                          'Valor: ' +
                              tableTest[vehicle].value.toString() +
                              ' + Taxa: ' +
                              tableTest[vehicle].rate.toString() +
                              ' = ' +
                              tableTest[vehicle].total.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      );
                    },
                  ),

                  //CAMPO INFORMAÇÕES ADICIONAIS
                  FieldInputNewReserve(
                    controller: _controllerFieldTest2,
                    minCharacters: 4,
                    activeValidator: false,
                    labelTextOfInput: 'Informações adicionais',
                    textInputType: TextInputType.streetAddress,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          //BOTÃO SUBMIT
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: ButtonBlueGradient(
              textButton: 'Solicitar reserva',
              functionExecuteOnPressed: _doNewReserve,
            ),
          ),
        ],
      ),
    );
  }

  void _doNewReserve() async {
    //Valida os campos do formulário. Em caso de erro, mostra a msg definida.
    _formNewReserveKey.currentState?.validate();
  }

  String getDateText() {
    if (dateStartReserve == null) {
      return 'Selecione a data*';
    } else {
      return '${dateStartReserve!.day}/${dateStartReserve!.month}/${dateStartReserve!.year}';
    }
  }

  String getTimeText() {
    if (timeStartReserve == null) {
      return 'Horário*';
    } else {
      final hours = timeStartReserve!.hour.toString().padLeft(2, '0');
      final minutes = timeStartReserve!.minute.toString().padLeft(2, '0');
      return '$hours:$minutes';
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateStartReserve ?? initialDate,
      firstDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day), //só mostra datas a partir do dia atual.
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (newDate == null) return;
    //Não sendo nulo, vamos atualizar nosso state do form:
    setState(() => dateStartReserve = newDate);
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: timeStartReserve ?? initialTime,
    );

    if (newTime == null) return;
    //Não sendo nulo, vamos atualizar nosso state do form:
    setState(() => timeStartReserve = newTime);
  }
}
