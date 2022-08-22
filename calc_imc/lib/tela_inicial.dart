import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

TextEditingController _controllerPeso = TextEditingController();
TextEditingController _controllerAltura = TextEditingController();
String _resultado = '';
String _netImage = 'https://c.tenor.com/r8Tkd82JD7gAAAAM/weighting-balance.gif';

class TelaInicial extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }

}

class TelaInicialState extends State<TelaInicial>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Calculadora IMC'),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Padding(
             padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
             child: Text('Insira as informações',
               style: TextStyle(fontSize: 25.0),
             ),
           ),
           //campos de widget de preenchimento de texto
           criarEditText('Peso (Kg)', _controllerPeso),
           criarEditText('Altura (cm)', _controllerAltura),

           //widget do resultado
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                 child: Text(_resultado, style: TextStyle(fontSize: 25.0),),
               ),
               SizedBox(
                 width: 300,
                 height: 300,
                 child: Image.network('$_netImage'),
               ),
             ],
           ),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 50.0,
                   width: 250.0,

                   child: ElevatedButton(
                       onPressed: (){
                         /*Decidi extrair o cálculo para um método a parte
                              *pra facilitar o entendimento do código
                         */
                         _calculaIMC();
                       },
                       child: Text('Calcular IMC'),
                   ),
                 ),
               ),
               FloatingActionButton(
                 child: const Icon(Icons.refresh),
                 onPressed: (){
                   _reiniciaCampos();
                 },
               ),
             ],
           ),

         ],
       ),
     ),
   );
  }

  Padding criarEditText(String label, TextEditingController _controller){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            fontSize: 25,

          )
        ),
      ),
    );

  }

  void _calculaIMC() {
    //lógica do botão clicado
    double? peso = double.tryParse(_controllerPeso.text);
    double? altura = double.tryParse(_controllerAltura.text);

    if ((peso != null && peso > 0) && (altura != null && altura > 0)) {
      altura = altura/100;
      double imc_calc = (peso / (altura * altura)).roundToDouble();

      _entregaResultado(imc_calc);

    }else{
      setState(() {
        _resultado = 'Preencha os dados corretamente';
      });
    }

  }

  void _entregaResultado(imc){

    if (imc < 18.5){
      setState(()
      {
        _resultado = "IMC: $imc. Abaixo do peso.";
        _netImage = 'https://c.tenor.com/J4B4YpGC6UsAAAAd/skinny-gotenks-gotenks.gif';

      }
      );
    }

    else if (imc >= 18.5 && imc < 25){
      setState(()
      {
        _resultado = "IMC: $imc. Peso normal.";
        _netImage = 'https://64.media.tumblr.com/a7c6165cdf20a3eb0251bcd33463860a/2d53549d34336171-59/s540x810/792cf7e5926c27307a9a60d6f0e15cea4a612d34.gif';

      }
      );
    }

    else if (imc >= 25 && imc < 30){
      setState(()
      {
        _resultado = "IMC: $imc. Sobrepeso.";
        _netImage = 'https://media1.giphy.com/media/hKafco7mFwBioBxqFT/giphy.gif';

      }
      );
    }

    else if (imc >= 30 && imc < 35){
      setState(()
      {
        _resultado = "IMC: $imc. Obesidade Grau I.";
        _netImage = 'https://c.tenor.com/wS3kEfkmrREAAAAC/buu-eat.gif';

      }
      );
    }

    else if (imc >= 35 && imc < 40){
      setState(()
      {
        _resultado = "IMC: $imc. Obesidade Grau II.";
        _netImage = 'https://c.tenor.com/d9GvSsPKxe8AAAAC/majin-buu-buu.gif';

      }
      );
    }

    else if (imc >= 40){
      setState(()
      {
        _resultado = "IMC: $imc. Obesidade Grau III.";
        _netImage = 'https://c.tenor.com/TMgTnvahBukAAAAd/r9-ronaldo.gif';

      }
      );
    }
  }

  void _reiniciaCampos(){
    _controllerAltura.clear();
    _controllerPeso.clear();
    setState(() {
      _resultado = '';
      _netImage = 'https://c.tenor.com/r8Tkd82JD7gAAAAM/weighting-balance.gif';
    });
  }

}

