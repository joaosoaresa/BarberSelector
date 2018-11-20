import 'package:flutter/material.dart';
import "signup.dart";
import 'remember.dart';
import 'homepage.dart';
import 'homepageE.dart';
import 'adminpage.dart';
import 'barbeiro.dart';
import 'produto.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/remember': (BuildContext context) => new RememberPage(),
        '/homepage': (BuildContext context) => new LoginG(),
        '/homepageE': (BuildContext context) => new HomePageE(),
        '/inicial': (BuildContext context) => new MyHomePage(),
        '/admin': (BuildContext context) => new AdminPage(),
        '/barbeiro': (BuildContext context) => new Barberpage(),
        '/produto': (BuildContext context) => new Produtopage(),
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  String _email;
  String _senha;

  void _signInG() async{
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      FirebaseUser firebaseUser = await auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );

      Navigator.of(context).push(
        new MaterialPageRoute(
            builder:(BuildContext context)=> new LoginG(
              user: firebaseUser,
              googleSignIn: googleSignIn ,
            )
        )
      );
    }

  void _signInE() {
    if(_email == 'admin' && _senha == 'admin') {
        Navigator.of(context).pushReplacementNamed('/admin');
    } else {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email, password: _senha).then((FirebaseUser user) {
        Navigator.of(context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                new HomePageE(
                  user: user,
                )
            )
        );
      }).catchError((e){
        _PopUpErro("Impossivel realizar login");
      });
    }
  }


  _PopUpErro (String val) async {
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

  _Popup() async{
    await showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('ADMIN LOGIN'),
          contentPadding: const EdgeInsets.all(16.0),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'USUARIO',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _email = val,
                ),),
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'SENHA',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  onChanged: (val) => _senha = val,
                ),
              ),
              ],
          ),
          actions: <Widget>[
            new FlatButton(onPressed: (){
              if(_email == 'admin' && _senha == 'admin') {
                Navigator.of(context).pushReplacementNamed('/admin');
              }else{
                Navigator.of(context).pop();
              }
            },
              child: Center(
                  child: Text('Logar',
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

  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;
    Color _eyeButtonColor;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Barber',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Selector',
                        style: TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(240.0, 160.0, 0.0, 0.0),
                    child: InkWell(
                        child: new Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)
                    ),
                      onTap: _Popup,
                    )
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'EMAIL',
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
                          });},
                      )]
                )
            ),
    Container(
    padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
    child: Column(
    children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
                obscureText: _isObscure,
                onChanged: (val){
                setState(() {
                 _senha = val;
                });},
            )]
    )
    ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment(1.0, 1.0),
              padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 10.0),
              child: InkWell(
                onTap: () {Navigator.of(context).pushNamed('/remember');},
                child: Text(
                  'Esqueci a senha',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green,
                elevation: 7.0,
                child: FlatButton(
                  onPressed: (){
                    _signInE();
                    },
                  child: Center(
                    child: Text('LOGIN',
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
                child: FlatButton(
                  onPressed: () {
                    _signInG();
                  },
                  child:
                  Center(
                    child: Text('Logar com Google',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                  ),),),),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                'Novo no BarberSelector ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 4.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Registre-se',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
          ],
        ));
    }}

