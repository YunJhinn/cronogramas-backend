import 'dart:convert';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _lista = [
    'Turma A',
    'Turma B',
    'Turma C',
    'Turma D',
    'Turma E',
    'Turma F',
    'Turma G',
    'Turma H',
    'Turma I',
    'Turma J'
  ];

  final List<int> colorCodes = <int>[
    800,
    400,
    800,
    400,
    800,
    400,
    800,
    400,
    800,
    400
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Turmas"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(40),
        child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _lista.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.cyan[colorCodes[index]],
                  child: Center(child: Text(' ${_lista[index]}')),
                );
              }),
        ),
      ),
    );
  }
}
