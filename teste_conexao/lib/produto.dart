import "package:flutter/material.dart";
import 'services/usermanagement.dart';

class Produtopage extends StatefulWidget {
  @override
  _Produtopage createState() => _Produtopage();
}

class _Produtopage extends State<Produtopage> {

  String _nome;
  String _valor;
  String _novo;

  _PopupA() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Alterar dados'),
          contentPadding: const EdgeInsets.all(16.0),
          content: new Column(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'NOVO VALOR',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                        onChanged: (val){
                          setState(() {
                            _valor = val;
                          });
                        } ,
                ),
              ),
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'NOVO NOME',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _novo = val,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              UserManagement().updateProd(_nome, _novo, _valor, context);
              Navigator.of(context).pop();
            },
              child: Center(
                  child: Text('Alterar',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  )
              ),
            )
          ],
        )
    );
  }

  _PopupD() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Deletar Produto'),
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'NOME BARBEIRO',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  //onChanged: () ,
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              UserManagement().deleteProd(_nome, context);
              Navigator.of(context).pop();
            },
              child: Center(
                  child: Text('Deletar',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  )
              ),
            )
          ],
        )
    );
  }

  _PopupC() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Cadastrar Produto'),
          contentPadding: const EdgeInsets.all(16.0),
          content: new Column(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'NOME',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _nome = val,
                ),
              ),
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'VALOR',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _valor = val,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              UserManagement().storeProd(_nome, _valor, context);
              Navigator.of(context).pop();
            },
              child: Center(
                  child: Text('Cadastrar',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  )
              ),
            )
          ],
        )
    );
  }

  void _back(){
    Navigator.of(context).pushReplacementNamed('/admin');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text("Produtos"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
              tooltip: 'Voltar',
              onPressed: _back),
          IconButton(icon: Icon(Icons.settings),
              onPressed: null)
        ],
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 150.0, height: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: new NetworkImage('https://cdn.pixabay.com/photo/2012/04/18/00/32/barbershop-36290_960_720.png'), fit: BoxFit.cover)
                ),
              ),
              new Text('CONFIGURAÇÕES'),
              new Text("DE",
                textAlign: TextAlign.center,
              ),
              new Text("PRODUTO"),
              SizedBox(height: 30.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: FlatButton(
                    onPressed: (){
                      _PopupC();
                    },
                    child: Center(
                      child: Text('Cadastrar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: FlatButton(
                    onPressed: (){
                      _PopupD();
                    },
                    child: Center(
                      child: Text('Deletar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: FlatButton(
                    onPressed: (){
                      _PopupA();
                    },
                    child: Center(
                      child: Text('Alterar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: InkWell(
                    onTap: () {},
                    child:
                    Center(
                      child: Text('voltar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),),),),
            ],
          ),
        ),
      ),
    );
  }
}
