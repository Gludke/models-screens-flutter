import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  AddressScreenState createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
  var currentAsset = '';
  Addresses? address;
  bool isLoading = false;

  TextEditingController txtPostalCode = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtDistrict = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtState = TextEditingController();
  TextEditingController txtNumber = TextEditingController();

  Users? user = new Users(
      url: '',
      name: 'Sem usuario',
      active: true,
      birth: null,
      country: '',
      cpfCnpj: '',
      loginWith: '',
      id: 0,
      email: '',
      language: '',
      sex: '',
      type: '',
      uuid: '');

  back() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    Timer.run(load);
  }

  changedCep(String text) async {
    print(text);
    if (text.length == 10) {
      setState(() {
        isLoading = true;
      });

      final a = await Repo.getAddressByCep(text);

      if (a != null) {
        setState(() {
          address = a;

          txtAddress.text = address!.address!;
          txtCity.text = address!.city!;
          txtDistrict.text = address!.district!;
          txtState.text = address!.state!;
        });
      }

      print('ok');
    }

    setState(() {
      isLoading = false;
    });
  }

  load() async {
    Addresses? _address = await new Preferences().getAddress();

    if (_address != null) {
      setState(() {
        address = _address;
      });

      txtAddress.text = address!.address!;
      txtPostalCode.text = address!.postalCode!;
      txtCity.text = address!.address!;
      txtNumber.text = address!.number!;
      txtState.text = address!.state!;
      txtDistrict.text = address!.district!;
    }
  }

  void save() async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    if (txtAddress.text.length == 0 ||
        txtPostalCode.text.length == 0 ||
        txtCity.text.length == 0 ||
        txtState.text.length == 0 ||
        txtDistrict.text.length == 0 ||
        txtNumber.text.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Todos os campos precisam ser preenchidos.'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
      ));
    } else {
      Addresses address = new Addresses(
        address: txtAddress.text,
        postalCode: txtPostalCode.text,
        city: txtCity.text,
        state: txtState.text,
        number: txtNumber.text,
        district: txtDistrict.text,
        // complement: txtc
      );

      await new Preferences().setAddress(address);
      // Util.back(context, null);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();

        return !isLoading;
      },
      child: Scaffold(
        appBar: LaterToolbarWirhSub(
          height: 96,
          title: 'Editar Endereço',
          back: () {
            Navigator.pop(context);
          },
        ),
        body: isLoading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : Container(
                padding: EdgeInsets.all(8),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                                height: 40,
                                child: Center(
                                  child: Input(
                                    inputType: TextInputType.numberWithOptions(
                                        signed: true, decimal: false),
                                    formatters: [
                                      TextInputMask(mask: '99.999-999')
                                    ],
                                    onchange: changedCep,
                                    txtController: txtPostalCode,
                                    hint: "CEP",
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: address != null,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 40,
                                  child: Input(
                                    txtController: txtAddress,
                                    hint: "Endereço",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: address != null,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 40,
                                  child: Input(
                                    txtController: txtDistrict,
                                    hint: "Bairro",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: address != null,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 40,
                                  child: Input(
                                    inputType: TextInputType.numberWithOptions(
                                        signed: true, decimal: false),
                                    txtController: txtNumber,
                                    hint: "Número",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: address != null,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 40,
                                  child: Input(
                                    txtController: txtCity,
                                    hint: "Cidade",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: address != null,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                  height: 40,
                                  child: Input(
                                    txtController: txtState,
                                    hint: "Estado",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: Visibility(
          visible: address != null,
          child: Container(
            padding: EdgeInsets.all(32),
            child: SizedBox(
              width: 160,
              height: 48,
              child: ElevatedButton(
                child: Text('SALVAR',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 20)),
                onPressed: save,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shadowColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String hint;
  final TextEditingController txtController;
  final Function(String s)? onchange;
  final List<TextInputFormatter>? formatters;
  final TextInputType? inputType;

  const Input(
      {Key? key,
      required this.hint,
      required this.txtController,
      this.formatters,
      this.onchange,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        controller: txtController,
        onChanged: onchange,
        keyboardType: inputType ?? TextInputType.text,
        inputFormatters: formatters,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.blue)),
            filled: true,
            hintStyle:
                TextStyle(color: Colors.grey[600], fontFamily: 'Montserrat'),
            hintText: hint,
            fillColor: Colors.white),
      ),
    );
  }
}