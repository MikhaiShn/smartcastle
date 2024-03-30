import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_6/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key); // Исправили super.key на key

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {


  String formattedPublishedDate(String publishedAt) {
    DateTime dateTime = DateTime.parse(publishedAt);
    String formattedDate = DateFormat('d MMMM y', 'ru').format(dateTime);
    return formattedDate;
  }

  List<Articles> newsFromServer = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));
    if (response.statusCode == 200) {
      News newsModel = News.fromJson(jsonDecode(response.body));

      setState(() {
        newsFromServer = newsModel.articles!;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новости'),
        backgroundColor: Colors.redAccent,
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          newsFromServer.clear();
          getNews();
        },
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: newsFromServer.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
        
                  print(DateFormat('dd MMMM yyyy').format(DateTime.parse(newsFromServer[index].publishedAt!)));
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsFromServer[index].title!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Автор: ${newsFromServer[index].author!}'),
                          Text(formattedPublishedDate(
                              newsFromServer[index].publishedAt!)),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
