import "package:flutter/material.dart";

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  String _email;
  String _senha;

  _Popup() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'NOVO EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val) => _email = val,
                  ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
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

  void _signOut(){
    Navigator.of(context).pushReplacementNamed('/inicial');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text("Modo Administrador"),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100.0, height: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: new NetworkImage('https://www.logolynx.com/images/logolynx/23/23938578fb8d88c02bc59906d12230f3.png'), fit: BoxFit.cover)
                ),
              ),
              new Text('Admin'),
              new Text("Você esta Logado"),
              SizedBox(height: 15.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/barbeiro');
                    },
                    child: Center(
                      child: Text('Configurações de Barbeiros',
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
                      Navigator.of(context).pushReplacementNamed('/produto');
                    },
                    child: Center(
                      child: Text('Configurações de Produtos',
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
                    onTap: () {_signOut();},
                    child:
                    Center(
                      child: Text('Logout',
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
