import "package:flutter/material.dart";
import 'services/usermanagement.dart';


class Barberpage extends StatefulWidget {

  @override
  _Barberpage createState() => _Barberpage();
}

class _Barberpage extends State<Barberpage> {

  String _nome;
  String _status;
  String _novo;

  _PopUp(String val) async {
    showDialog(context: context,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(child:
              new Text(val)
              )
            ],
          ),
        )
    );
  }

  _PopupA() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Atualizar Barbeiro'),
          contentPadding: const EdgeInsets.all(10.0),
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
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'STATUS',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _status = val,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              UserManagement().updateBarber(_nome,_novo, _status);
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

  _PopupD() async{
    await showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Deletar Barbeiro'),
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
          onChanged: (val)=> _nome = val,
          ),
        )
        ],
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          UserManagement().deleteBarber(_nome, context);
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
        title: new Text('Cadastrar Barbeiro'),
        contentPadding: const EdgeInsets.all(10.0),
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
                  onChanged: (val){
                      setState(() {
                        _nome = val;
                      });}
          ),
        ),
            new Expanded(
              child: new TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'STATUS',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val){
                      setState(() {
                        _status = val;
                      });}
              ),
            ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          UserManagement().storeBarber(_nome, _status, context);
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
        title: new Text("Barbeiro"),
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
                width: 200.0, height: 200.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: new NetworkImage('https://png2.kisspng.com/sh/b2d37b415184658d367b9aaadeef748c/L0KzQYm3UsAyN5t9fZH0aYP2gLBuTfNwdZMyetN7YnX1PcT7ifNsbaMygNNycnT1dcT6hgIuapZmjeZELYDkgr32lgIucJDxfNt3Zz3kPbT2jfIuaZ9pReVsaYP2f8P6TfJiepNqip8AYUe2dIrqVcQ4Omo3UJC7MEK2RYq7UsE2OWg6TKMDMkm1SYK8TwBvbz==/kisspng-comb-barber-sticker-hairdresser-beauty-parlour-holding-a-comb-and-scissors-barber-5a73d9c5472928.2023594215175418292915.png'), fit: BoxFit.cover)
                ),
              ),
              new Text('CONFIGURAÇÕES'),
              new Text("DE",
              textAlign: TextAlign.center,
              ),
              new Text("BARBEIRO"),
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
                      //_sendData(_nome, _status);
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
