import 'dart:async';
import 'package:atv_crud_aluno/controller/aluno_dao.dart';
import 'package:atv_crud_aluno/model/aluno.dart';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Aluno])
abstract class BancoDeDadosApp extends FloorDatabase {
  AlunoDAO get alunoDAO;
}
