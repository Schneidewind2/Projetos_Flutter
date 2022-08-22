import 'dart:convert';

import 'package:consumo_api/data/characters_api.dart';
import 'package:consumo_api/telas/tela_detalhes.dart';
import 'package:flutter/material.dart';

import 'package:consumo_api/model/characters_model.dart';

class TelaPersonagens extends StatefulWidget {
  const TelaPersonagens({Key? key}) : super(key: key);



  @override
  State<TelaPersonagens> createState() => _TelaPersonagensState();
}

class _TelaPersonagensState extends State<TelaPersonagens> {
  List<PersonagensGot> listaPersonagens = <PersonagensGot>[];

  //consumindo o json para uma lista
  void getPersonagensFromAPI() async {
    PersonagensAPI.getPersonagens().then((response){
      setState(() {
        var inverno = json.decode(response.body);
        Iterable lista = inverno;
        listaPersonagens = lista.map((model) => PersonagensGot.fromJson(model)).toList();
      });
    });
  }

  //setando o estado antes da constrção da tela
  @override 
  void initState() {
    getPersonagensFromAPI();
    super.initState();
  }
     

  //desenho da tela
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Lista de personagens'),
      //  ),
      body: ListView.builder(
        itemCount: listaPersonagens.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(listaPersonagens[index].firstName),
            subtitle: Text(listaPersonagens[index].lastName),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listaPersonagens[index].imageUrl),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) => TelaDetalhes(personagensGot: listaPersonagens[index],))));
            },
          );
        }),
      );
  }
}