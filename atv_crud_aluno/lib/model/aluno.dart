import 'package:atv_crud_aluno/model/entidade_base.dart';
import 'package:floor/floor.dart';

@entity
class Aluno extends Pessoa {
  final String curso;
  final String matricula;

  Aluno(
      {int? id,
      required String nome,
      required String dataNasc,
      required String sexo,
      required String dataCriacao,
      required this.curso,
      required this.matricula})
      : super(id, nome, dataNasc, sexo, dataCriacao);
}
