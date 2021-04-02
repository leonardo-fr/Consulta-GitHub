import 'package:flutter/material.dart';
import 'Perfil.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchName extends StatefulWidget {
  Map<String, dynamic> _busca;
  final String _name;
  int _i;
  SearchName(this._busca , this._name, this._i);



  @override
  _SearchNameState createState() => _SearchNameState(_busca, _name, _i);
}

class _SearchNameState extends State<SearchName> {
  Map<String, dynamic> _busca;
  final String _name;
  int _i;
  _SearchNameState(this._busca, this._name, this._i);

  _repeat(int cont){
    int exibePagina = _busca['items'].length;
    exibePagina--;
    return Column(
      children: [
          Image.network("${_busca['items'][cont]['avatar_url']}"),
          Padding(padding: EdgeInsets.only(top:10, bottom: 10)),
          Text(
            _busca['items'][cont]['login'].toString(),
          style: TextStyle(
            fontSize: 18,
            color: Colors.limeAccent
            ),
      ),
      Text(
        "https://www.github.com/${_busca['items'][cont]['login'].toString()}",
        style: TextStyle(
            fontSize: 14,
            color: Colors.limeAccent
            )
      ,),
      Padding(padding: EdgeInsets.only(top: 20),),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Text(
          "página $cont/$exibePagina"
        )
      ],)
      ],
    );
     
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🔎 $_name"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: (){
          
          if (_i < _busca['items'].length){
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SearchName(_busca, _name, _i)),
          );
          }
          
        },
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: RaisedButton(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
            color: Color(0xffFF6D13),
            onPressed: (){},
            child: Center(
              child: 
              _busca['items'] == null?
              Text("Nada encontrado."):
              Column(children: [
                if (_busca['items'].length.toString() != null)
                  _repeat(_i++)

              ],)
          ,
        )
          )
           
        ),
      ),
    );
  }
}

