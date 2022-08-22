import 'package:atv_crud_aluno/database/database.dart';
import 'package:atv_crud_aluno/model/aluno.dart';
import 'package:atv_crud_aluno/view/tela_detalhes.dart';
import 'package:atv_crud_aluno/view/tela_inserir.dart';
import 'package:flutter/material.dart';

class ListaAlunos extends StatefulWidget {
  const ListaAlunos({Key? key, required this.bd, this.aluno}) : super(key: key);
  final BancoDeDadosApp bd;
  final Aluno? aluno;

  @override
  State<ListaAlunos> createState() => _ListaAlunosState();
}

class _ListaAlunosState extends State<ListaAlunos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Alunos"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var resultado = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TelaInserir(
                  bd: widget.bd,
                  tituloAppbar: 'Inserir Registro',
                );
              },
            ),
          );
          if (resultado == null || resultado == false) {
          } else if (resultado) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: entregaLista(),
    );
  }

  Widget entregaLista() {
    return StreamBuilder<List<Aluno>>(
        stream: widget.bd.alunoDAO.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].nome),
                    subtitle: Text('Curso: ${snapshot.data![index].curso}'),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                var resultado = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return TelaInserir(
                                        bd: widget.bd,
                                        aluno: snapshot.data![index],
                                        tituloAppbar: 'Editar Registro',
                                      );
                                    },
                                  ),
                                );
                                if (resultado == null || resultado == false) {
                                } else if (resultado) {
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.edit))
                        ],
                      ),
                    ),
                    onTap: () async {
                      var resultado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TelaDetalhes(
                              bd: widget.bd,
                              aluno: snapshot.data![index],
                            );
                          },
                        ),
                      );
                      if (resultado) {
                        setState(() {});
                      }
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Sem dados cadastrados'),
            );
          }
        });
  }
}
