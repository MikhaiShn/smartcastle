import 'package:flutter/material.dart';
import 'package:flutter_application_6/catalogModal.dart';

class ProductsDetail extends StatefulWidget {
  final Products product;
  const ProductsDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductsDetail> createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  final TextStyle customStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детальная информация'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  widget.product.title!,
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                Image.network(widget.product.images![0]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Raiting: ${widget.product.rating.toString()}',
                  style: customStyle,
                ),
                Text(
                  'Price: ${widget.product.price.toString()} ₸',
                  style: customStyle,
                ),
                Text('Brand: ${widget.product.description}', style: customStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
