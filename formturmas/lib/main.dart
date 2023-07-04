import 'dart:convert';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formulário de cadastro para : Turmas",
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.cyan),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Homestate();
}

class _Homestate extends State<Home> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _turnocontroller = TextEditingController();
  final TextEditingController _datainiciocontroller = TextEditingController();
  final TextEditingController _datafimcontroller = TextEditingController();
  final TextEditingController _horasauladiacontroller = TextEditingController();
  final TextEditingController _fkcursocontroller = TextEditingController();
  final format = DateFormat("hh:mm a");

  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _dates = [
    DateTime.now(),
  ];
  // List<DateTime?> _multiDatePickerValueWithDefaultValue = [
  //   DateTime(today.year, today.month, 1),
  //   DateTime(today.year, today.month, 5),
  //   DateTime(today.year, today.month, 14),
  //   DateTime(today.year, today.month, 17),
  //   DateTime(today.year, today.month, 25),
  // ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de cadastro para : Turmas"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
          margin: EdgeInsets.all(100),
          padding: EdgeInsets.all(20),
          child: Center(
              child: SingleChildScrollView(
                  child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _turnocontroller,
                  decoration: const InputDecoration(
                      labelText:
                          "Insira o turno ( Vespertino, Matutino ou Noturno )",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.add_alarm_sharp)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }
                  },
                ),
                Text("Escolha no calendário a data de inicio do Curso"),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(),
                  value: _dates,
                  onValueChanged: (dates) => _dates = dates,
                ),
                Text("Escolha no calendário a data de Encerramento do Curso"),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(),
                  value: _dates,
                  onValueChanged: (dates) => _dates = dates,
                ),
                DateTimeField(
                  decoration: InputDecoration(
                      labelText: "Escolha aqui o tempo de hora aula diário",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_alarm_sharp)),
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return time == null ? null : DateTimeField.convert(time);
                  },
                ),
                TextFormField(
                  controller: _fkcursocontroller,
                  decoration: const InputDecoration(
                      labelText: "Insira o Curso que está cadastrando",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.accessibility_new)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Obrigatório";
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        debugPrint("Musica Cadastrada com Sucesso");
                        Fluttertoast.showToast(
                            msg: "Musica cadastrada com Sucesso ",
                            gravity: ToastGravity.TOP_RIGHT,
                            backgroundColor: Colors.green);
                      }
                      ;
                    },
                    child: const Text("Cadastrar")),
              ],
            ),
          )))),
    );
  }
}
