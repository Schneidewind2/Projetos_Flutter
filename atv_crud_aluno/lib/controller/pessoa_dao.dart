import 'package:atv_crud_aluno/model/entidade_base.dart';
import 'package:floor/floor.dart';

abstract class PessoaDAO<Model extends Pessoa> {
  @insert
  Future<int> insertItem(Model item);

  @delete
  Future<int> deleteItem(Model item);

  @update
  Future<int> updateItem(Model item);
}
