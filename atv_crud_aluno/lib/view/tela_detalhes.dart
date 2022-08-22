import 'package:atv_crud_aluno/database/database.dart';
import 'package:atv_crud_aluno/model/aluno.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key, required this.aluno, required this.bd})
      : super(key: key);
  final Aluno aluno;
  final BancoDeDadosApp bd;

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalhes do Aluno'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          //botao lixeira
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
                onPressed: () {
                  _confirmDelete();
                },
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            _criarResultado('Nome: ${widget.aluno.nome}'),
            _criarResultado('Data de nascimento: ${widget.aluno.dataNasc}'),
            _criarResultado('Sexo: ${widget.aluno.sexo}'),
            _criarResultado('Curso: ${widget.aluno.curso}'),
            _criarResultado('Matrícula: ${widget.aluno.matricula}'),
            _criarResultado('Criado em: ${widget.aluno.dataCriacao}'),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete() async {
    await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Comfirmar exclusão'),
            content:
                Text('Deseja mesmo excluir a entrada\n${widget.aluno.nome}?'),
            actions: [
              MaterialButton(
                onPressed: (() {
                  widget.bd.alunoDAO.deleteItem(widget.aluno);
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                }),
                child: const Text('Sim'),
              ),
              MaterialButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: const Text('Não'),
              ),
            ],
          );
        });
  }
}

Container _criarResultado(String label) {
  return Container(
    margin: const EdgeInsets.all(3.0),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueAccent),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 23,
      ),
    ),
  );
}
