import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:ex_api_node_flutter/question.dart';
import 'package:flutter/material.dart';

class Affichage extends StatefulWidget {
  const Affichage({ Key? key }) : super(key: key);

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  
  late Future<List> _question ;

  @override 
  void initState() {
    super.initState();
    _question= Question.getAllQuestion();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("liste questions"),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: _question,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i){
                  return Card(
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          
                          Text(snapshot.data![i]['question'].toString(), style: const TextStyle(fontSize: 20),),
                          Text(snapshot.data![i]['reponse'].toString(), style: const TextStyle(fontSize: 20),),
                           ElevatedButton(onPressed: () {
                            Question.Delete(context, int.parse(snapshot.data![i]["id"].toString()));
                           }, child: const Text('Supprimer')),
                      ]),
                    ),
                  );
                }
                );
            }
            else{
              return const Center(
                child: Text("Pas de données"),
              );
            }
          },
        ),
        ),

    );
  }
}