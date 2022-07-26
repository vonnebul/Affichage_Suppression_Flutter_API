import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Question{
  static String baseUrl = "http://10.0.2.2:8000";
  static Future<List> getAllQuestion() async{
    try{
      var res = await http.get(Uri.parse(baseUrl+ "/question"));
      if(res.statusCode == 200){
        print(jsonDecode(res.body));
        return jsonDecode(res.body);
      }
      else{
        return Future.error("erreur serveur");
      }
    }
    catch(err){
      return Future.error(err);
    }
  }
  
  static Delete(BuildContext context, int id) async {
      var res = await http.delete(
        Uri.parse(baseUrl+'/question/'+id.toString()), 
        body: id.toString()
        );
      print(res.statusCode);
      if(res.statusCode == 200){
        Navigator.pushNamed(context, '/');
      }
      else{
        Navigator.pushNamed(context, '/');
      }
 
  }
}