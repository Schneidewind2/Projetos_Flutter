// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({Key? key}) : super(key: key);

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  final controller = TextEditingController();
  final list = <String>[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('É simples assim???'),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [ 
                Expanded(child: TextField(controller: controller,)),
                IconButton(onPressed: (){
                  final text = controller.text;
                  setState(() {
                    list.add(text);
                  });
                  controller.clear();
                }, 
                icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                final item = list[index];
                return ListTile(
                  title: Text(item),
                );
              },
            ),
          ),
        ],
      ),
    ); 
  }
}


/*                  EXEMPLO STATELESS WIDGET
  DEPENDE DE UM CONTROLADOR EXTERNO(Inherited Widget)*/

// import 'package:hello_world/home_controller.dart';

//  class HomePage extends StatelessWidget{
//    @override
//    Widget build(BuildContext context) {
//      var controller = HomeController.of(context);
//      return Scaffold(
//        appBar: AppBar(title: Text('Aprendendo sobre widgets no Fluterrando!')),
//        body: Center(
//          child: Text('Contando ${controller.value}'),
//        ),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          onPressed: (){
//           controller.increment(); 
//          },backgroundColor: Colors.greenAccent,
//        ),
//      );
//    }
//  }

/*                  EXEMPLO STATEFULL WIDGET
PERMITE GERENCIAR O ESTADO DIRETAMENTE NO CODIGO DO WIDGET*/

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var counter = 0;
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(title: Text('Aprendendo sobre widgets no Fluterrando!')),
//        body: Center(
//          child: Text('Contando $counter'),
//        ),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),
//          onPressed: (){
//            setState(() {
//             counter++;   
//            });
          
//           }
//         ),
//      );    
//   }
// }

