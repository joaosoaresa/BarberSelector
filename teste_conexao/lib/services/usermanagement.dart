import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement{
  storeNewUser(user, context){
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid
    }).then((values){
      //Navigator.of(context).pop();
      //Navigator.of(context).pushReplacementNamed('/homepage');

    }).catchError((e){
      print(e);
    });
  }
  storeBarber(nome, status, context){
    Firestore.instance.collection('barbeiro').document('barbeiro-$nome').setData({
      'nome': nome,
      'status': status,
    }).then((values){}).catchError((e){
      print(e);
    });
  }
  deleteBarber(nome, context){
    Firestore.instance.collection('barbeiro').document('barbeiro-$nome').delete();
  }
  updateBarber(nome, novo, status){
    if(novo == null){
      novo = nome;
    }
    Firestore.instance.collection('barbeiro').document('barbeiro-$nome').setData({
      'nome': novo,
      'status': status,
    }).then((values){}).catchError((e){
      print(e);
    });
  }

  storeProd(nome, valor, context){
    Firestore.instance.collection('produto').document('produto-$nome').setData({
      'nome': nome,
      'valor': valor,
    }).then((values){}).catchError((e){
      print(e);
    });
  }
  deleteProd(nome, context){
    Firestore.instance.collection('produto').document('produto-$nome').delete();
  }
  updateProd(nome, novo, valor, context){
    if(novo == null){
      novo = nome;
    }
    Firestore.instance.collection('produto').document('produto-$nome').setData({
      'nome': novo,
      'valor': valor,
    }).then((values){}).catchError((e){
      print(e);
    });
  }
}