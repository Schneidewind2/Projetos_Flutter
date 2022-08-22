import 'package:floor/floor.dart';

class Pessoa {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String nome;
  late final String dataNasc;
  final String sexo;
  final String dataCriacao;

  Pessoa(this.id, this.nome, this.dataNasc, this.sexo, this.dataCriacao);
}
