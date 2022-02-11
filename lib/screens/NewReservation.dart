import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  //### VARS PARA DROPDAWN:
  String delayHoursOrigin = '0';
  String delayHoursDestiny = '0';
  String dropdownPaymentMethod = '';
  //###
  //### VARS PARA DATAS E TEMPO:
  late DateTime? dateStartReserve = null;
  late TimeOfDay? timeStartReserve = null;
  //###
  //### VARS DE VISIBILIDADES DE WIDGETS:
  bool formVisibility = false;
  bool formCreditPaymentVisibility = false;
  bool dateAndTimeErrorVisibility = false;
  bool whatsappContactVisibility = false;
  //###
  //### CONTROLLERS CARTÃO DE CRÉDITO:
  final TextEditingController _controllerCardNumber = TextEditingController();
  final TextEditingController _controllerValidity = TextEditingController();
  final TextEditingController _controllerSecurityCode = TextEditingController();
  final TextEditingController _controllerTitularName = TextEditingController();
  //###
  final TextEditingController _controllerCostCenter = TextEditingController();
  final TextEditingController _controllerFieldOrigin = TextEditingController();
  final TextEditingController _controllerFieldDestiny = TextEditingController();
  final TextEditingController _controllerFieldMoreInformation =
      TextEditingController();
  final TextEditingController _controllerFieldPassengers =
      TextEditingController();
  final TextEditingController _controllerFieldPhone = TextEditingController();
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
                    children: const [
                      Icon(
                        Icons.calendar_today_outlined,
                      ),
                      Text(
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
                              style: const TextStyle(fontSize: 16),
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
                              style: const TextStyle(fontSize: 16),
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
                  //MSG DE ERRO DATA E HORÁRIO
                  MsgError(
                      visible: dateAndTimeErrorVisibility,
                      msgError: 'Favor selecionar data e horário da reserva',
                      fontSize: 12.0),
                  //CAMPO ORIGEM DA VIAGEM
                  FieldInputNewReserve(
                    controller: _controllerFieldOrigin,
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
                    children: [
                      const Text(
                        'Tempo de espera, caso haja:  ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropDownDelayHours(dropdownValue: delayHoursOrigin),
                      const Text(
                        'h',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  //CAMPO DESTINO DA VIAGEM
                  FieldInputNewReserve(
                    controller: _controllerFieldDestiny,
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
                    children: [
                      const Text(
                        'Tempo de espera, caso haja:  ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      DropDownDelayHours(dropdownValue: delayHoursDestiny),
                      const Text(
                        'h',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  //CONTATO WHATS EM CASO DE RESERVA 'D-24H':
                  MsgError(
                      visible: whatsappContactVisibility,
                      msgError:
                          'Reservas com menos de 24 horas de antecedência precisam ser tratadas previamente com nosso atendimento. Por favor, contate nosso atendimento especializado via Whatsapp:',
                      fontSize: 14.0),
                  Container(
                    height: 10.0,
                  ),
                  DefaultButton(
                    visible: whatsappContactVisibility,
                    backgroundColor: Colors.green,
                    text: 'Abrir no Whatsapp',
                    save: () => _openWhatsappSuportContact(),
                  ),
                  //BOTÃO DE CÁLCULO DE COTAÇÕES
                  ButtonBlueGradient(
                      paddingLeft: 0,
                      paddingRight: 0,
                      textButton: 'Calcular cotações',
                      click: _doNewReserve),
                  Visibility(
                    visible: formVisibility,
                    child: Column(
                      children: [
                        //LISTA DE VEÍCULOS DISPONÍVEIS
                        // ListView.separated(
                        //   padding: const EdgeInsets.only(top: 16.0),
                        //   shrinkWrap: true,
                        //   separatorBuilder: (_, _____) => const Divider(),
                        //   itemCount: tableTest.length,
                        //   itemBuilder: (context, vehicle) {
                        //     return ListTile(
                        //       leading: Image.asset(tableTest[vehicle].icon),
                        //       title: Text(
                        //         'Valor: ' +
                        //             tableTest[vehicle].value.toString() +
                        //             ' + Taxa: ' +
                        //             tableTest[vehicle].rate.toString() +
                        //             ' = ' +
                        //             tableTest[vehicle].total.toString(),
                        //         style: const TextStyle(
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //     );
                        //   },
                        // ),
                        //CAMPO DADOS DO PASSAGEIRO
                        FieldInputNewReserve(
                          controller: _controllerFieldPassengers,
                          minCharacters: 4,
                          activeValidator: false,
                          labelFontSize: 20.0,
                          fontSize: 16.0,
                          labelTextOfInput: 'Dados do(s) passageiro(s)',
                          textInputType: TextInputType.text,
                          maxLength: 160,
                          maxLines: 3,
                        ),
                        //TELEFONE DE CONTATO
                        FieldInputNewReserve(
                          controller: _controllerFieldPhone,
                          minCharacters: 4,
                          labelTextOfInput: 'Telefone de contato',
                          labelFontSize: 20.0,
                          hintText: 'Digite apenas números',
                          activeValidator: false,
                          textInputType: TextInputType.streetAddress,
                          maxLength: 9,
                          paddingTop: 36,
                          border: const OutlineInputBorder(),
                        ),
                        //CAMPO INFORMAÇÕES ADICIONAIS
                        FieldInputNewReserve(
                          controller: _controllerFieldMoreInformation,
                          minCharacters: 4,
                          activeValidator: false,
                          labelFontSize: 16.0,
                          fontSize: 16.0,
                          labelTextOfInput:
                              'Orientações para o receptivo: (placa, código,\n identificador, observações, etc.)',
                          textInputType: TextInputType.text,
                          maxLength: 160,
                          maxLines: 3,
                        ),
                        //OPÇÕES DE PAGAMENTO
                        Container(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Forma de pagamento:  ',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700)),
                            DropDownPaymentMethods(
                              dropValueReturn: dropdownPaymentMethod,
                            ),
                          ],
                        ),
                        //
                        FieldInputNewReserve(
                          controller: _controllerCostCenter,
                          minCharacters: 4,
                          labelTextOfInput: 'Centro de custo',
                          activeValidator: false,
                          textInputType: TextInputType.number,
                          paddingTop: 16,
                          border: const OutlineInputBorder(),
                        ),
                        //OPÇÕES PARA PAGAMENTO COM CARTÃO DE CRÉDITO
                        Visibility(
                          visible: true, //formCreditPaymentVisibility,
                          child: Column(
                            children: [
                              FieldInputNewReserve(
                                controller: _controllerCardNumber,
                                minCharacters: 4,
                                labelTextOfInput: 'Número do cartão*',
                                activeValidator: false,
                                textInputType: TextInputType.number,
                                paddingTop: 16,
                                border: const OutlineInputBorder(),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: FieldInputNewReserve(
                                      controller: _controllerValidity,
                                      minCharacters: 4,
                                      labelTextOfInput: 'Validade*',
                                      activeValidator: false,
                                      textInputType: TextInputType.number,
                                      paddingTop: 16,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                  Container(width: 10.0),
                                  Expanded(
                                    child: FieldInputNewReserve(
                                      controller: _controllerSecurityCode,
                                      minCharacters: 4,
                                      labelTextOfInput: 'Cod. segurança*',
                                      hintText: '3 digitos atrás do cartão',
                                      activeValidator: false,
                                      textInputType: TextInputType.number,
                                      paddingTop: 16,
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              FieldInputNewReserve(
                                controller: _controllerTitularName,
                                minCharacters: 4,
                                labelTextOfInput: 'Nome do Titular*',
                                activeValidator: false,
                                textInputType: TextInputType.number,
                                paddingTop: 16,
                                border: const OutlineInputBorder(),
                              ),
                            ],
                          ),
                        ),

                        //BOTÃO SUBMIT - SOLICITAR RESERVA
                        ButtonBlueGradient(
                          paddingLeft: 0,
                          paddingRight: 0,
                          textButton: 'Solicitar reserva',
                          click: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //----------------- FUNÇÕES E MÉTODOS ------------------

  void _doNewReserve() async {
    //Valida os campos do formulário. Em caso de erro, mostra a msg definida.
    if (_formNewReserveKey.currentState!.validate() &&
        timeStartReserve != null &&
        dateStartReserve != null) {
      //Checa se a data é D-24h:
      var intervalTime =
          _calculateIntervalTime(dateStartReserve!, timeStartReserve!);
      if (intervalTime! <= 1440) {
        setState(() {
          whatsappContactVisibility = true;
          dateAndTimeErrorVisibility = false;
          formVisibility = false;
        });
        return;
      }
      setState(() {
        formVisibility = true;
        dateAndTimeErrorVisibility = false;
        whatsappContactVisibility = false;
      });
    } else {
      setState(() => dateAndTimeErrorVisibility = true);
    }
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

  int? _calculateIntervalTime(
      DateTime dateStartReserve, TimeOfDay timeStartReserve) {
    //Construir a data selecionada pelo usuário:
    var userdate = DateTime(dateStartReserve.year, dateStartReserve.month,
        dateStartReserve.day, timeStartReserve.hour, timeStartReserve.minute);
    // debugPrint(userdate.difference(DateTime.now()).inMinutes.toString());c
    return userdate.difference(DateTime.now()).inMinutes;
  }

  _openWhatsappSuportContact() async {
    var whatsappUrl =
        "whatsapp://send?phone=+5586994324465&text=Olá,tudo bem ?";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
