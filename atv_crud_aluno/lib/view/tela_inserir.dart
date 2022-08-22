import 'package:atv_crud_aluno/database/database.dart';
import 'package:atv_crud_aluno/model/aluno.dart';
import 'package:atv_crud_aluno/model/input_mask.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

class TelaInserir extends StatefulWidget {
  const TelaInserir(
      {Key? key, required this.bd, this.aluno, required this.tituloAppbar})
      : super(key: key);
  final BancoDeDadosApp bd;
  final String tituloAppbar;
  final Aluno? aluno;

  @override
  State<TelaInserir> createState() => _TelaInserirState();
}

class _TelaInserirState extends State<TelaInserir> {
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerCurso = TextEditingController();
  TextEditingController _controllerNasc = TextEditingController();
  TextEditingController _controllerMatr = TextEditingController();
  List<String> items = ['Masculino', 'Feminino'];
  String? selectedItem = 'Masculino';
  bool visaoReset = true;

  @override
  void initState() {
    _controllerNome = TextEditingController(
        text: widget.aluno != null ? widget.aluno?.nome : '');

    _controllerNasc = TextEditingController(
        text: widget.aluno != null ? widget.aluno?.dataNasc : date);

    _controllerCurso = TextEditingController(
        text: widget.aluno != null ? widget.aluno?.curso : '');

    _controllerMatr = TextEditingController(
        text: widget.aluno != null ? widget.aluno?.matricula : '');

    if (widget.tituloAppbar == 'Inserir Registro') {
      visaoReset = true;
    } else {
      visaoReset = false;
      selectedItem = widget.aluno?.sexo.toString();
    }

    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tituloAppbar),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          Visibility(
            visible: visaoReset,
            child: FloatingActionButton(
              heroTag: 'Reset fields',
              onPressed: (() {
                _reiniciaCampos();
              }),
              child: const Icon(Icons.refresh_outlined),
            ),
          ),
          FloatingActionButton(
            heroTag: 'Save',
            child: const Icon(Icons.save),
            onPressed: () {
              if (_controllerCurso.text.isNotEmpty &&
                  _controllerMatr.text.isNotEmpty &&
                  _controllerNome.text.isNotEmpty) {
                var aluno = Aluno(
                    id: widget.aluno != null ? widget.aluno!.id : null,
                    nome: _controllerNome.text,
                    dataNasc: _controllerNasc.text,
                    sexo: selectedItem.toString(),
                    dataCriacao:
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    curso: _controllerCurso.text,
                    matricula: _controllerMatr.text);

                if (widget.aluno != null) {
                  widget.bd.alunoDAO.updateItem(aluno);
                } else {
                  widget.bd.alunoDAO.insertItem(aluno);
                }
                _reiniciaCampos();
                Navigator.pop(context, true);
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              criarEditText('Nome: ', stringFormatter, _controllerNome,
                  TextInputType.text),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 5),
                    child: ElevatedButton(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Center(
                            child: Text(
                                'Selecione a Data de Nascimento: ${_controllerNasc.text}')),
                      ),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;

                        setState(() =>
                            date = DateFormat('dd/MM/yyyy').format(newDate));
                        _controllerNasc.text = date;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Text(
                        'Sexo:',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: selectedItem,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(fontSize: 25)),
                              ))
                          .toList(),
                      onChanged: (String? item) => setState(() {
                        selectedItem = item;
                      }),
                    ),
                  ],
                ),
              ),
              criarEditText('Curso: ', stringFormatter, _controllerCurso,
                  TextInputType.text),
              criarEditText('Matrícula: ', matrFormatter, _controllerMatr,
                  TextInputType.number),
            ],
          ),
        ),
      ),
    );
  }

  void _reiniciaCampos() {
    _controllerCurso.clear();
    _controllerMatr.clear();
    _controllerNasc.clear();
    _controllerNome.clear();
  }

  Padding criarEditText(String label, MaskTextInputFormatter formatter,
      TextEditingController controller, TextInputType teclado) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 5),
      child: TextField(
        keyboardType: teclado,
        inputFormatters: [formatter],
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
