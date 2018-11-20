import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'services/usermanagement.dart';

void main(){}

class _SignupPageState extends State<SignupPage> {

  String _email;
  String _senha;
  String _user;

  void _PopUp(String val) async {
    return showDialog(context: context,
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

  void _teste(){
      if (_user == null)
        _PopUp('INSIRA UM NOME');
      else if (_user.length < 2)
        _PopUp('NOME MUITO CURTO');
      if (_senha == null)
        _PopUp('INSIRA UM SENHA');
      else if (_senha.length < 6)
        _PopUp('SENHA MUITO CURTA');
      if (_email == null)
        _PopUp('INSIRA UM EMAIL');
      else if (!_email.contains('@'))
        _PopUp('EMAIL INVALIDO');
  }

  void _tryCreate(String user, String senha, String email) {
    _teste();
    if(email.contains('@') && senha.length >= 6 && user.length >= 2) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: senha).then((
          signedInUser) {
        UserManagement().storeNewUser(
            signedInUser, context);
      }).catchError((e) {
        print(e);
      });
      _PopUp('Cadastro realizado');
      Navigator.of(context).pushReplacementNamed('/inicial');
      //print("Explodiu");
     _sendData();
    }
  }

  void _sendData() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    if (_email.contains('@') && _senha.length >= 6 && _user.length >= 2) {
      var data = {
        "Usuario": _user,
        "Senha": _senha,
        "Email": _email
      };
      ref.child('Teste').push().set(data);
      //Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                  child: Text(
                    'Cadastrar',
                    style:
                    TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(270.0, 120.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'NOME',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _user = val,
                ),
                SizedBox(height: 5.0),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'SENHA',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        _senha = val;
                      });
                    }
                ),
                SizedBox(height: 5.0),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    onChanged: (val) {
                      setState(() {
                        _email = val;
                      });
                    }
                ),
                SizedBox(height: 30.0),
                Container(
                  height: 40.0,
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: FlatButton(
                        onPressed: () {
                            _tryCreate(_user, _senha, _email);
                          },
                        child: Center(
                        child: Text('CADASTRAR',
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                      )
                  ),
                ),
                  ),
                ),
    SizedBox(height: 20.0),
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
    Navigator.of(context).pop();
    },
    child:
    Center(
    child: Text('Voltar',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat')),
    ),),),),
              ],
            ),
          ),
        ],
        ));
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
