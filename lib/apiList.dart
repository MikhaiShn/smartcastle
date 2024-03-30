import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/news.dart';
import 'package:flutter_application_6/profile.dart';
import 'package:http/http.dart' as http;

class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  bool usersLoading = false;
  List<Profile> users = [];
  List<Articles>? articles;

  Future getNews() async{
    final response2 = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));
    if (response2.statusCode == 200){
        News news = News.fromJson(jsonDecode(response2.body));
        setState(() {
          articles = news.articles!;
        });
    }
  }

  // Future getUsers() async {

  //     setState(() {
  //       usersLoading = true;
  //     });

  //     final response = await http
  //         .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  //     if (response.statusCode == 200) {
  //       List<Profile> usersFromApi = List.from(jsonDecode(response.body))
  //           .map((map) => Map<String, dynamic>.from(map))
  //           .map((Map<String, dynamic> map) => Profile.fromJson(map))
  //           .toList();
  //           setState(() {
  //             users = usersFromApi;
  //             usersLoading = false;
            
  //           });
            
  //     }
  //   }
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api List'),
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.redAccent,
      ),
      body: 
      usersLoading == true ?
      Center(child: CupertinoActivityIndicator()) :
      
      
      ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              (articles![index].title!),
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
