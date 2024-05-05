import 'package:flutter/material.dart';
import 'package:flutter_application_6/shopCategory.dart';
import 'package:flutter_application_6/shopHome.dart';
import 'package:flutter_application_6/shopItemDetail.dart';
import 'package:flutter_application_6/shopProfile.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> array = ['1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
        backgroundColor: const Color.fromARGB(255, 141, 102, 88),
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Center(child: ElevatedButton(onPressed: () {}, child: Text('data')))],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(152, 105, 90, 0.65),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Color.fromRGBO(152, 105, 90, 0.65),
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(152, 105, 90, 0.65),
                ),
                label: 'Profile')
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ShopHome()));
            }
            if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopCategory()));
            }
            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopProfile()));
            }
          }),
      drawer: Container(
        width: 270,
        child: Drawer(
          child: ListView(
            children: [Text('Модели')],
          ),
        ),
      ),
    );
  }
}
