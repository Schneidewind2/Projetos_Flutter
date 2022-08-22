import 'package:atv_crud_aluno/database/database.dart';
import 'package:atv_crud_aluno/view/tela_inicial.dart';
import 'package:flutter/material.dart';

// bloco do main com o SQLITE
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(
    bd: await $FloorBancoDeDadosApp
        .databaseBuilder('atividade_crud.db')
        .build(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade final: CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaInicial(bd: bd),
    );
  }
}
