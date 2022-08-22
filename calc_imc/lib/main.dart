import 'package:calc_imc/tela_inicial.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MeuApp());

}

class MeuApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,

      ),

      home: TelaInicial(),
    );
  }
}
