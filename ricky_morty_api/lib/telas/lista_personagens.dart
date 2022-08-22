import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ricky_morty_api/data/personagem_api.dart';
import 'package:ricky_morty_api/model/personagem_model.dart';

class ListaPersonagens extends StatefulWidget {
  

  @override
  State<ListaPersonagens> createState() {
    return ListaPersonagensState();
  }
}

class ListaPersonagensState extends State<ListaPersonagens> {
  List<Personagem> listaPersonagens = <Personagem>[];

  //consumindo o json para uma lista
  void getPersonagensFromAPI() async {
    PersonagensAPI.getPersonagens().then((response){
      setState(() {
        var morty = json.decode(response.body);
        Iterable lista = morty['results'];
        listaPersonagens = lista.map((model) => Personagem.fromJson(model)).toList();
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
      appBar: AppBar(
        title: const Text('Lista de personagens'),
        ),
      body: ListView.builder(
        itemCount: listaPersonagens.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(listaPersonagens[index].name),
            subtitle: Text(listaPersonagens[index].species),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listaPersonagens[index].image),
            ),
          );
        }),
      );
  }
}