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

  void _verificaSobra(double sobra, double galaoAux, List<dynamic> resultados){

    if(sobra < 0){
      setState(() {
        _textoResultado = 'Resultado: ' + resultados.toString();
        _textoSobra = 'Faltou: ' + sobra.toString() + ' Adicione mais garrafas para completar o galão';
        _textoGalao = 'Galão: ' + galaoAux.toString();
      });
    }else{
      setState(() {
        _textoResultado = 'Resultado: ' + resultados.toString();
        _textoSobra = 'Sobra: ' + sobra.toString();
        _textoGalao = 'Galão: ' + galaoAux.toString();
      });
    }

  }
  //metodo para limpar todos os campos
  void _limpar(){
    setState(() {
      _textoGalao = '';
      _textoSobra = '';
      _textoResultado = '';
      _textoGarrafas = '';
      _textoQtdGarrafas = '';
      _garrafas.clear();
      _qtdGarrafas = 0;
      _txtEditingControllerGalao.text = '';
      _txtEditingControllerLitrosGarrafas.text = '';
    });
  }

  // metodo para remover o ultimo item da lista
  void _removerGarrafa(){
    //validar se a lista está vazia
    if(_garrafas.isEmpty == true){
      setState(() {
        _textoResultado = 'Lista vazia adicione os itens';
        _textoGarrafas = 'Garrafas: 0';
      });
    }else {
      _garrafas.removeLast(); // remove o ultimo item da lista
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
      setState(() {
        _textoQtdGarrafas = 'Quantidade de Garrafas: ' + _qtdGarrafas.toString();
        _textoGarrafas = 'Garrafas: ' + _garrafas.toString();
        _textoResultado = '';
        _txtEditingControllerLitrosGarrafas.text = '';
      });
    }
  }
  //metodo para calcular o resultado
  void _calcular(){
    double galao = double.tryParse(_txtEditingControllerGalao.text);
    double sobra = 0;
    double galaoAux = 0;
    var resultados =[];
    //validar se o usuario entrou com os dados
    if(galao == null || _garrafas.isEmpty == true){
      setState(() {
        _textoResultado = "Por favor entre com os dados";
      });
    }else{
      double galaoAux = galao;
      _garrafas = _garrafas..sort((b,a) => a.compareTo(b));
      for(int i = 0; i < _garrafas.length; i++){
        if(galao - _garrafas[i] > 0 || galao - _garrafas[i] >= -0.5){
          galao = galao - _garrafas[i];
          resultados.add(_garrafas[i]);
          sobra = sobra + _garrafas[i];
        }
      }
      sobra = sobra - galaoAux;
      _verificaSobra(sobra, galaoAux, resultados);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    IconButton(
                        icon: Icon(Icons.add_circle),
                        tooltip: 'Adicione uma garrafa',
                        color: Colors.cyan,
                        iconSize: 46,
                        onPressed: _adicionaGarrafa,
                      ) ,
                   IconButton(
                        icon: Icon(Icons.remove_circle),
                        tooltip: 'Remova uma garrafa',
                        color: Colors.cyan,
                        iconSize: 46,
                        onPressed: _removerGarrafa,
                      ),

                    IconButton(
                        icon: Icon(Icons.cleaning_services_rounded),
                        tooltip: 'Limpar todos os campos',
                        color: Colors.cyan,
                        iconSize: 46,
                        onPressed: _limpar,
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
                    'Calcular',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: _calcular,
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
