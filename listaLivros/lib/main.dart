import 'package:flutter/material.dart';
import 'modelo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de livros',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Livro> livros = [];
  List<Autor> autores = [];

  @override
  void initState() {
    super.initState();
    autores.add(Autor('Victor hugo', '444.555.444-98'));
    autores.add(Autor('Markus Zusak', '111.222.333-87'));
    autores.add(Autor('Mark Manson ', '888.999.888-54'));
    autores.add(Autor('Kiyosaki, Robert T.', '444.777.555-97'));
    livros.add(Romance('Os Miseráveis', '6555520817', '1862', 17.49, autores[0],
        true));
    livros.add(Romance('A menina que roubava livros', '8598078174', '2007',
        55.41, autores[1], true));
    livros.add(Romance('O último dia de um Condenado a morte', '9788573770216',
        '1829', 6.00, autores[0], false));
    livros.add(AutoAjuda('A Sutil Arte de Ligar o F*da-Se', '855100249X',
        '2017', 29.99, autores[2], 'felicidade'));
    livros.add(AutoAjuda('Desenvolva sua inteligência financeira',
        ' 8550801283', '2017', 37.99, autores[3], 'Saúde financeira'));
    livros.sort((a, b) => a.titulo.compareTo(b.titulo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Livros"),
        ),
      body: ListView.separated(
          itemBuilder: (context, index){
            var livro = livros[index];
            return ListTile(

              title: Text(livro.titulo),
              subtitle: Text("${livro.autor.nome}, ${livro.dataLancamento}"),

              trailing: IconButton(
                icon: Icon(Icons.book),
                onPressed: () => {},
              )

            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: livros.length));
  }
}

