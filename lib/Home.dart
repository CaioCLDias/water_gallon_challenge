import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controllers para recuperar os dados do TextField
  TextEditingController _txtEditingControllerGalao = new TextEditingController();
  TextEditingController _txtEditingControllerLitrosGarrafas = new TextEditingController();
  //variáveis:
  String _textoGalao ='';
  String _textoQtdGarrafas = '';
  String _textoResultado = '';
  String _textoGarrafas = '';
  String _textoSobra = '';
  var _garrafas = [];
  int _qtdGarrafas = 0;

  void _removerGarrafa(){

    //validar se tem item na lista
    if(_garrafas.isEmpty == true){
      setState(() {
        _textoResultado = 'Lista vazia adicione os itens';
      });
    }else {
      _garrafas.removeLast();
      _qtdGarrafas = _qtdGarrafas - 1;
      setState(() {
        _textoResultado = '';
        _textoQtdGarrafas = 'Quantidade de Garrafas: ' + _qtdGarrafas.toString();
        _textoGarrafas = 'Garrafas: ' + _garrafas.toString();
      });
    }
  }

  //metodo para adicionar garras na list
  void _adicionaGarrafa(){

    double garrafa = double.tryParse(_txtEditingControllerLitrosGarrafas.text);

    //validar se o usuário preencheu os campos
    if(garrafa == null){
      setState(() {
        _textoResultado ='Por favor insira o valor do litro da garrafa';
      });
    }else{
      _garrafas.add(garrafa);
      _qtdGarrafas = _qtdGarrafas + 1;

      print(_garrafas.toString());
      print(_qtdGarrafas);
      setState(() {
        _textoQtdGarrafas = 'Quantidade de Garrafas: ' + _qtdGarrafas.toString();
        _textoGarrafas = 'Garrafas: ' + _garrafas.toString();
        _textoResultado = '';
        _txtEditingControllerLitrosGarrafas.text = '';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YesList Challenge'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Quantidade de Litros do Galão, Ex 7.5'
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.cyan
                ),
                controller: _txtEditingControllerGalao,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Litros das Garrafas Ex: 1.0',
                ),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.cyan
                ),
                controller: _txtEditingControllerLitrosGarrafas,
              ),
              Row(
                  children: [

                    IconButton(
                        icon: Icon(Icons.add_circle),
                        tooltip: 'Adicione uma garrafa',
                        color: Colors.cyan,
                        onPressed: _adicionaGarrafa,
                    ),
                    IconButton(
                        icon: Icon(Icons.remove_circle),
                        tooltip: 'Remova uma garrafa',
                        color: Colors.cyan,
                        onPressed: _removerGarrafa,
                    ),
                  ],
                ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: RaisedButton(
                  color: Colors.cyan,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'calcular',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _textoGalao,
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _textoQtdGarrafas,
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _textoGarrafas,
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  _textoSobra,
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
