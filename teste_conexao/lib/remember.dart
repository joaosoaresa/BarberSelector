import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class _RememberPageState extends State<RememberPage> {

  FirebaseAuth auth = FirebaseAuth.instance;
  String _email;

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

  void _tryEmail(String val) async{
    if (val == null)
      _PopUp('INSIRA UM EMAIL');

    else if (!val.contains('@'))
      _PopUp('EMAIL INVALIDO');

    else if(val != null && val.contains('@')){
    auth.sendPasswordResetEmail(email: _email);
    _PopUp('Solicitação enviada');
    await new Future.delayed(new Duration(milliseconds: 2000));
    Navigator.of(context).pushReplacementNamed('/inicial');
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
                    'Lembrar',
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
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val){
                      setState(() {
                        _email = val;
                      });
                    },
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: FlatButton(
                          onPressed: (){//_validateInputs;
                            _tryEmail(_email);
                            },
                          child: Center(
                              child: Text('LEMBRAR-ME',
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
    ],),);
  }
}

class RememberPage extends StatefulWidget {
  @override
  _RememberPageState createState() => _RememberPageState();
}
