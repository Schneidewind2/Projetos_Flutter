import 'package:consumo_api/model/characters_model.dart';
import 'package:flutter/material.dart';

class TelaDetalhes extends StatelessWidget {
  final PersonagensGot personagensGot;
  const TelaDetalhes({Key? key, required this.personagensGot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(personagensGot.fullName),),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(personagensGot.imageUrl)),
            ),
              
            Text('Título: ${personagensGot.title}'),
            Text('Casa: ${personagensGot.family}')
          ],
        ),
      ),
    );
  }
}