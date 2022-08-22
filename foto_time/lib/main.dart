// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  //rodar app ou classe do app
  runApp(TelaInicial());
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Um texto filosófico", //Texto da aba no navegador
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bem dinâmico"),
        ),
        body: Center(
          child: SizedBox(
              height: 80, width: 80, child: Image.asset('escudo_time.png')),
        ),
      ),
    );
  }
}
