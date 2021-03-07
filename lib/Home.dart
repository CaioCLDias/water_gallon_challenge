import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              ),
              Row(
                  children: [

                    IconButton(
                        icon: Icon(Icons.add_circle),
                        tooltip: 'Adicione uma garrafa',
                        color: Colors.cyan,
                        onPressed: () {}
                    ),
                    IconButton(
                        icon: Icon(Icons.remove_circle),
                        tooltip: 'Remova uma garrafa',
                        color: Colors.cyan,
                        onPressed: () {}
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:20,right: 30),
                    child: Text(
                      'Galão',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20, left: 20),
                    child: Text(
                      'Quantidade de Garrafa',
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:20,),
                child: Text(
                  'Garrafas',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20,),
                child: Text(
                  'Garrafas Utilizadas',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  'Sobra',
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
