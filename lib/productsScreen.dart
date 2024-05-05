import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/catalog.dart';
import 'package:flutter_application_6/catalogModal.dart';
import 'package:http/http.dart' as http;

class ProductsScreen extends StatefulWidget {
  String categoryName;
  ProductsScreen({super.key, required this.categoryName});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Products> productsScreen = [];
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Future getProducts() async {
    final response = await http.get(Uri.parse(
        'https://dummyjson.com/products/category/${widget.categoryName}'));
    CatalogModal catalogModal = CatalogModal.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      setState(() {
              productsScreen = catalogModal.products!;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 89, 168, 233),
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
          ),itemCount: productsScreen.length, itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(child: Image.network(productsScreen[index].images!.first)),
                    Text(productsScreen[index].title!,style: TextStyle(color: Colors.black,fontSize: 15),),
                  ],
                ),
              ),
            );
          }
      )
      );
  }
}
