import 'package:app_github/screens/nameSearch.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Perfil.dart';

class HomeGithub extends StatefulWidget {
  @override
  _HomeGithubState createState() => _HomeGithubState();
}

class _HomeGithubState extends State<HomeGithub> {
  TextEditingController _controllerID = TextEditingController();
  var _textoResultado = " ";

  final String _urlBase = "https://api.github.com/"; 

  void _buscarID() async{

    if(_controllerID.text == ""){
      _textoResultado = "O Campo não pode ficar vazio!";
      setState(() {
        _textoResultado;
      });
    }else{
      setState(() {
        _textoResultado = ' ';
      });
      
      http.Response response = await http.get(_urlBase + "users/" + _controllerID.text);
      Map<String, dynamic> dadosJson = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Perfil(dadosJson))
      );
    }

  }

  void _buscarNome() async{
     if(_controllerID.text == ""){
      _textoResultado = "O Campo não pode ficar vazio!";
      setState(() {
        _textoResultado;
      });
    }else{
      setState(() {
        _textoResultado = ' ';
      });
      
      http.Response response = await http.get(_urlBase + "search/users?q=" + _controllerID.text);
      Map<String, dynamic> dadosJson = json.decode(response.body);
      int _i = 0;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SearchName(dadosJson, _controllerID.text, _i))
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do GitHub'),
        backgroundColor: Color(0xffFF6D13),
      ),
      
      body: Container(
        padding: EdgeInsets.all(1),
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              Image.asset("images/github_logo_black3.png"),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Text("Digite o ID ou nome do github:"),
              TextField(
                controller: _controllerID,
              ),
            Center(
              child:   Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: RaisedButton(
                      color: Color(0xffFF6D13),
                      textColor: Colors.white,
                      child: Text("Pesquisar por ID"),
                      onPressed: _buscarID,
                  
                  )
                ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: RaisedButton(
                  color: Color(0xffFF6D13),
                  textColor: Colors.white,
                  child: Text("Pesquisar por nome"),
                  onPressed: _buscarNome,
                  
                )
              )
                ],
              ),
            ),
              Text(
                  _textoResultado,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
