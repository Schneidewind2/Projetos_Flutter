import 'package:atv_crud_aluno/controller/pessoa_dao.dart';
import 'package:atv_crud_aluno/model/aluno.dart';
import 'package:floor/floor.dart';

@dao
abstract class AlunoDAO extends PessoaDAO<Aluno> {
  @Query('SELECT * FROM aluno WHERE id = :id')
  Stream<Aluno?> getById(int id);

  @Query('SELECT * FROM aluno')
  Stream<List<Aluno>> getAll();
}
