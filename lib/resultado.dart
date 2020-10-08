import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  final int pontuacao;
  var newTaskCtrl = TextEditingController();
  var newPassCtrl = TextEditingController();

  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  // https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=[API_KEY]

  void autenticar() {
    String emailUsuario = newTaskCtrl.text;
    String senha = newPassCtrl.text;
    print(emailUsuario);
    signup(emailUsuario, senha);
    print(emailUsuario + 'adicionou usuário');
    login(emailUsuario, senha);
    // print(emailUsuario + 'autenticou usuário');
  }

  Future<void> _authenticate(String email, String password, urlsegment) async {
    // final String url =
    //    'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA4amB0r6iD-7LPgrkSqLmme1i1cIBeJRE';

    final String url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA4amB0r6iD-7LPgrkSqLmme1i1cIBeJRE';

    //  final String url =
    //      'https://identitytoolkit.googleapis.com/v1/accounts:$urlsegment?key=AIzaSyA4amB0r6iD-7LPgrkSqLmme1i1cIBeJRE';
    final response = await http.post(url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  // AIzaSyA4amB0r6iD-7LPgrkSqLmme1i1cIBeJRE

  String get fraseResultado {
    if (pontuacao < 0) {
      return 'Parabéns';
    } else {
      return 'Parabéns! Seu Score de questões:  ' +
          pontuacao.toString() +
          " questões corretas";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Center(
          child: TextFormField(
            controller: newTaskCtrl,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
                labelText: "Favor autenticar-se informando seu email",
                labelStyle: TextStyle(color: Colors.red)),
          ),
        ),
        Center(
          child: TextFormField(
            controller: newPassCtrl,
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
                labelText: "Favor autenticar-se informando sua senha",
                labelStyle: TextStyle(color: Colors.red)),
          ),
        ),
        FlatButton(
          child: Text(
            'Autenticar-se ->',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: autenticar,
        ),
        FlatButton(
          child: Text(
            'Deseja Testar seu conhecimento sobre Mudanças climáticas? ->',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
