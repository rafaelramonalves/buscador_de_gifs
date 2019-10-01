import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//url dos trendins https://api.giphy.com/v1/gifs/trending?api_key=E83YIvnny7OfkY5kxcl9rDfUwbarmR1j&limit=20&rating=G
//url da pesquisa https://api.giphy.com/v1/gifs/search?api_key=E83YIvnny7OfkY5kxcl9rDfUwbarmR1j&q=dogs&limit=25&offset=25&rating=G&lang=pt


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;

  int _offset = 0; //quantidade de gifs por pagina

  //Função para pegar os gifs
  Future<Map> _getGifs() async{
    http.Response response; //fazer a chamada
    if(_search==null){ // Não foi passado nenhum nome de gif então tras o trenddins
      response =await http.get("https://api.giphy.com/v1/gifs/trending?api_key=E83YIvnny7OfkY5kxcl9rDfUwbarmR1j&limit=20&rating=G"); //url da requisição
    }else{// trazer o que foi pesquisado
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=E83YIvnny7OfkY5kxcl9rDfUwbarmR1j&q=$_search&limit=25&offset=$_offset&rating=G&lang=pt");
    }
    return json.decode(response.body); //devolver o json com os dados
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map){ //then para chamar quando o map ja estiver preenchido
      print(map);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}