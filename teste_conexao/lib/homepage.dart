import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginG extends StatefulWidget {
  LoginG({this.user, this.googleSignIn});
  final FirebaseUser user;
  final GoogleSignIn googleSignIn;
  @override
  _LoginG createState() => _LoginG();
}

class _LoginG extends State<LoginG> {

  FirebaseAuth auth = FirebaseAuth.instance;
  String _email;
  String _senha;

  void _signOut(){
    Navigator.of(context).pushReplacementNamed('/inicial');
  }

  void _PopUp(String val) async {
    return showDialog(context: context,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(child:
              new Text(val,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontFamily: 'Montserrat')
              ),
              ),
            ],
          ),
        )
    );
  }

  void _Popup(String valor, String texto) async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Alterar $texto'),
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: texto,
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => valor = val,
                ),),
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              if(texto == 'Senha')
                _tryPass(valor);

              else if(texto == 'Email') {
                _tryEmail(_email);
              }
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

  void _tryPass(String val) {

    if (val == null)
      _PopUp('INSIRA UM SENHA');

    else if (val.length < 6)
      _PopUp('SENHA MUITO CURTA');

    else if(val.length >6)
      widget.user.updatePassword(_senha);

  }

  void _tryEmail(String val) {

    if (val == null)
      _PopUp('INSIRA UM EMAIL');

    else if (!val.contains('@'))
      _PopUp('EMAIL INVALIDO');

    else if(val.contains('@') && val != null){
      if (widget.user.email != _email) {
        widget.user.updateEmail(_email);
      }
      else {
        _PopUp('Email já existente');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text("Bem-vindo"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
              tooltip: 'Logout',
              onPressed: _signOut),
          IconButton(icon: Icon(Icons.settings),
              onPressed: null)
        ],
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60.0, height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: new NetworkImage(widget.user.photoUrl), fit: BoxFit.cover)
                ),
              ),
              new Text(widget.user.displayName),
              new Text("Você esta Logado"),
              SizedBox(height: 15.0),
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
                    onTap: () {
                      widget.googleSignIn.signOut();
                      FirebaseAuth.instance.signOut();
                      _signOut();},
                    child:
                    Center(
                      child: Text('Logout',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),),),),

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
                    onTap: () {
                      _Popup(_email, 'Email');
                    },
                    child:
                    Center(
                      child: Text('Alterar Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),),),),
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
                    onTap: () {
                      _Popup(_senha, 'Senha');
                    },
                    child:
                    Center(
                      child: Text('Alterar senha',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),),),),
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
                    onTap: () {
                      widget.user.delete();
                      _signOut();},
                    child:
                    Center(
                      child: Text('Deletar Usuario',
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
