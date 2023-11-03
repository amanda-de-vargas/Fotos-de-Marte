import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:marsphotos/model/fotos.dart';

class FtsP extends StatefulWidget { 
  final String text;
  FtsP(this.text);

  @override
  State<FtsP> createState() => _FtsPState(this.text);
}

class _FtsPState extends State<FtsP> {
  int paginaAtual=1;
  List todasimagens = [];
  final String text;
  _FtsPState(this.text);

  Future<List> pageData(String sol) async {
    final response = await http.Client()
        .get(Uri.parse("http://mars-photos.herokuapp.com/api/v1/rovers/Perseverance/photos?sol="+sol));
    if (response.statusCode == 200) {
      var meusDados = json.decode(response.body);
      List dados = meusDados['photos'];
      dados.forEach((dado) {
        Data foto = Data(sol: dado['sol'], imgSrc: dado['img_src'], earthDate: dado['earth_date']);
        todasimagens.add(foto);
      });
      return todasimagens;
    } else {
      throw Exception("Falha ao carregar os dados do personagem. ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Fotos de Marte com o Rover Perseverance")),
    body: FutureBuilder(initialData: const [], future: pageData(text), builder: (context, snapshot) {
      List dados = snapshot.data as List;
      if(snapshot.hasData){
        if(snapshot.connectionState == ConnectionState.done){
          return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, index) {
            return 
            Container(
              child: Column(
                children: [
                  Image.network(dados[index].imgSrc),
                  Text("Data terrestre: "+dados[index].earthDate.toString())
                ],
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              
              );
          },);
        } else {
          return Center(child: const CircularProgressIndicator());
        }
        
      } else {
        return const Text("Não há fotos");
      }
      
     })
          
     );
  }}
