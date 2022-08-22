import 'package:atv_crud_aluno/database/database.dart';
import 'package:atv_crud_aluno/view/tela_listar.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key, required this.bd}) : super(key: key);
  final BancoDeDadosApp bd;

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/logowide.png',
                    /* fit: BoxFit.fill */
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Aplicação CRUD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 5,
                    fontSize: MediaQuery.of(context).size.width / 15,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/team.png', fit: BoxFit.scaleDown),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ListaAlunos(bd: widget.bd);
                      },
                    ),
                  );
                },
                child: const Text('Entrar'),
              ),
              const Text('Por: Rafael Schneidewind Vieira')
            ],
          ),
        ),
      ),
    );
  }
}
