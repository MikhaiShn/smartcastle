import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/info.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  String nameFromserver = ' ';
  String username = ' ';
  String email = ' ';
  String address = ' ';
  int idFromServer = 0;
  

 void initState() {
    // TODO: implement initState
    super.initState();
    
    getInfoFromServer();
  }

  Future getInfoFromServer() async {
    final response =
      await  http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

        response.statusCode;
        print(response.statusCode);

        if(response.statusCode == 200){
          Info info = Info.fromJson(jsonDecode(response.body));
          setState(() {
             nameFromserver = info.name!;
             username = info.username!;
             email = info.email!;
             address = info.address!.street!;
          });
          
        } else {
          throw 'Ошибка';
        }
  }

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(nameFromserver, style: TextStyle(fontSize: 20),),
            Text(username, style: TextStyle(fontSize: 20),),
            Text(address, style: TextStyle(fontSize: 20),)
          ],
        ) 
        
      ),
      
    );
  }
}
