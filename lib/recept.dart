import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/InfoList.dart';
import 'package:flutter_application_6/ReceptModal.dart';
import 'package:http/http.dart' as http;

class Recept extends StatefulWidget {
  const Recept({super.key});

  @override
  State<Recept> createState() => _ReceptState();
}

class _ReceptState extends State<Recept> {

  List<Recipes> recipes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecepts();
  }

   Future getRecepts() async{
    final response = await  http.get(Uri.parse('https://dummyjson.com/recipes'));
    if (response.statusCode == 200) {
      ReceptModel receptModel = ReceptModel.fromJson(jsonDecode(response.body));

      setState(() {
        recipes = receptModel.recipes!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Recept'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,20),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(
                name: recipes[index].name!,
                image: recipes[index].image!,
                ingredients: recipes[index].ingredients!,
              )));
            },
            child: Column(
              children: [
                Image.network(recipes[index].image!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(recipes[index].name!, style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}