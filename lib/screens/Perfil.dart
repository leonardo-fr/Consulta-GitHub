import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Perfil extends StatefulWidget {
  Map<String, dynamic> _perfil;
  Perfil(this._perfil);
  @override
  _PerfilState createState() => _PerfilState(_perfil);
}

class _PerfilState extends State<Perfil> {
  Map<String, dynamic> _perfil;
  _PerfilState(this._perfil);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _perfil['name'] == null?
          "🔎 (sem nome)"
          :'🔎 ${_perfil['name']}',
          style: TextStyle(fontSize: 14),
          ),
          backgroundColor: Color(0xffFF6D13),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 10),
        child: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 32, 15, 30),
        child: _perfil['login'] == null?
        Center(
          child: Text("id não localizado"),
        )
        :Column(
          children: [
            Row(
              children: [
                Image.network(_perfil['avatar_url'],scale: 5,),
                Padding(padding: EdgeInsets.only(left: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _perfil['name'] == null?
                      "Não há nome cadastrado":
                      "${_perfil['name']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                    "ID: " + "${_perfil['login']}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15,),
                  )
                  ],
                )
                
              ]
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text(
                  _perfil['bio'] == null ?
                  "Não há bio cadastrada" :
                  "Bio: ${_perfil['bio']}",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
            Divider(
              height: 25,
              color: Color(0xffFF6D13),
            ),
            
          ],
        ),
        
      ),
        ),
      
    ));
  }
}

